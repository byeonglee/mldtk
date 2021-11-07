    public:
        $classname(BabblePE & ppe, DpsOPContext & cx) 
          : OP_Babble(ppe,cx)
        {
            initializeOperator();
        }

        virtual ~$classname() 
        {
            finalizeOperator();
        }

        /*
         * Function used to process cmd arguments                         
         */
        void processCmdArgs(const std::string & args);

        /*
         * Function used to initialize the operator
         */
        void initializeOperator();

        /*
         * Function used to finalize the operator
         */
        void finalizeOperator();

        /*
         * Function used to submit tuples
         */
        void submit(uint32_t port, Distillery::SBuffer const & buf)
        {
            outputBufferQ.push_back(new DataItem(port, new Distillery::SBuffer(buf)));
        }


        /*
         * Function used to submit tuples
         */
        void submitAll()
        {
          while (!outputBufferQ.empty()) {
             DataItem* di = outputBufferQ.front();
             babblePE.submit(di->port, *di->buf);
             outputBufferQ.pop_front();
             delete di;
          }
        }


        /*
         * Functions used to process input tuples
         */
        void process(uint32_t port, Distillery::SBuffer const & tuple);

        void process();

        /* this variable holds the input/output file name for a source/sink */
        std::string fileName;

        void shutdown();

    };

};

#endif /* _$classname_H_ */


