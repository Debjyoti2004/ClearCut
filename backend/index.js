import 'dotenv/config'
import express from 'express'
import cors from 'cors'
import connectDB from './configs/mongodb.js'
import userRouter from './routes/userRoutes.js'
import imageRouter from './routes/imageRoutes.js'



const PORT = process.env.PORT || 4000
const app = express()
await connectDB()


app.use(express.json())
app.use(cors())



app.get('/',(req,res)=> res.send("API Working"))

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.use('/api/user', userRouter)
app.use('/api/image',imageRouter)

app.listen(PORT, '0.0.0.0', () => console.log("Server Running on port " + PORT))
