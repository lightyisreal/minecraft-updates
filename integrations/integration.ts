export interface BDS {
    version: string;
    isPreview: boolean;
};

import EventEmitter from "node:events";
export abstract class Integration extends EventEmitter {
    public abstract start(): any;
};