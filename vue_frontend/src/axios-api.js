import axios from 'axios'

const getAPI = axios.create({
    baseURL: 'http://10.44.2.159',
    timeout: 10000,
})

export { getAPI }