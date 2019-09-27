// @flow

import type { ValueTag } from './RTCPeerConnection';

/**
 * DataChannel のラッパークラスです。
 * 
 */
export default class RTCDataChannel {

  /**
   * センダー ID
   */
  id: String;

  _valueTag: ValueTag;
  // TODO(kdxu): その他のパラメータを入れる

  /**
   * @ignore
   */
  constructor(info: Object) {
    this.id = info.id;
    this._valueTag = info.valueTag;
  }

}
