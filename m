Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from aserp2120.oracle.com ([141.146.126.78]:55120 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728999AbeJARhx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Oct 2018 13:37:53 -0400
Date: Mon, 1 Oct 2018 14:00:29 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] rpmsg: glink: Use the local intents when receiving data
Message-ID: <20181001110029.GA20364@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: sricharan@codeaurora.org
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Sricharan R,

The patch 64f95f87920d: "rpmsg: glink: Use the local intents when
receiving data" from Aug 24, 2017, leads to the following static
checker warning:

	drivers/rpmsg/qcom_glink_native.c:813 qcom_glink_rx_data()
	warn: integer overflows 'chunk_size + left_size'

drivers/rpmsg/qcom_glink_native.c
   781          if (avail < sizeof(hdr)) {
   782                  dev_dbg(glink->dev, "Not enough data in fifo\n");
   783                  return -EAGAIN;
   784          }
   785  
   786          qcom_glink_rx_peak(glink, &hdr, 0, sizeof(hdr));
   787          chunk_size = le32_to_cpu(hdr.chunk_size);
   788          left_size = le32_to_cpu(hdr.left_size);
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
My private build of Smatch marks le32_to_cpu() as untrusted.

   789  
   790          if (avail < sizeof(hdr) + chunk_size) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^
This could have an integer overflow.

   791                  dev_dbg(glink->dev, "Payload not yet in fifo\n");
   792                  return -EAGAIN;
   793          }
   794  
   795          rcid = le16_to_cpu(hdr.msg.param1);
   796          spin_lock_irqsave(&glink->idr_lock, flags);
   797          channel = idr_find(&glink->rcids, rcid);
   798          spin_unlock_irqrestore(&glink->idr_lock, flags);
   799          if (!channel) {
   800                  dev_dbg(glink->dev, "Data on non-existing channel\n");
   801  
   802                  /* Drop the message */
   803                  goto advance_rx;
   804          }
   805  
   806          if (glink->intentless) {
   807                  /* Might have an ongoing, fragmented, message to append */
   808                  if (!channel->buf) {
   809                          intent = kzalloc(sizeof(*intent), GFP_ATOMIC);
   810                          if (!intent)
   811                                  return -ENOMEM;
   812  
   813                          intent->data = kmalloc(chunk_size + left_size,
                                                       ^^^^^^^^^^^^^^^^^^^^^^
We haven't check "left_size" at all so Smatch is very suspicious of
this.

   814                                                 GFP_ATOMIC);
   815                          if (!intent->data) {
   816                                  kfree(intent);
   817                                  return -ENOMEM;
   818                          }
   819  

See also:

drivers/rpmsg/qcom_smd.c:1227 qcom_channel_scan_worker() warn: potential integer overflow from user 'smem_items[tbl].info_base_id + cid'
drivers/rpmsg/qcom_smd.c:1228 qcom_channel_scan_worker() warn: potential integer overflow from user 'smem_items[tbl].fifo_base_id + cid'

regards,
dan carpenter
