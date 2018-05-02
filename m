Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from aserp2130.oracle.com ([141.146.126.79]:58978 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751045AbeEBKSg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 2 May 2018 06:18:36 -0400
Date: Wed, 2 May 2018 13:18:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] remoteproc: st_slim_rproc: add a slimcore rproc driver
Message-ID: <20180502101828.GA9574@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-remoteproc-owner@vger.kernel.org
To: peter.griffin@linaro.org
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

[ This is slightly old.  It's a new static checker test I'm working on.
  - dan ]

Hello Peter Griffin,

The patch bb6869b21478: "remoteproc: st_slim_rproc: add a slimcore
rproc driver" from Oct 18, 2016, leads to the following static
checker warning:

	drivers/remoteproc/st_slim_rproc.c:131 slim_rproc_start()
	warn: potential ! vs ~ typo

drivers/remoteproc/st_slim_rproc.c
   113  /*
   114   * Remoteproc slim specific device handlers
   115   */
   116  static int slim_rproc_start(struct rproc *rproc)
   117  {
   118          struct device *dev = &rproc->dev;
   119          struct st_slim_rproc *slim_rproc = rproc->priv;
   120          unsigned long hw_id, hw_ver, fw_rev;
   121          u32 val;
   122  
   123          /* disable CPU pipeline clock & reset CPU pipeline */
   124          val = SLIM_CLK_GATE_DIS | SLIM_CLK_GATE_RESET;
   125          writel(val, slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
   126  
   127          /* disable SLIM core STBus sync */
   128          writel(SLIM_STBUS_SYNC_DIS, slim_rproc->peri + SLIM_STBUS_SYNC_OFST);
   129  
   130          /* enable cpu pipeline clock */
   131          writel(!SLIM_CLK_GATE_DIS,


SLIM_CLK_GATE_DIS is BIT(0) so !BIT(0) is just zero.  Maybe ~BIT(0) was
intended?

   132                  slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
   133  
   134          /* clear int & cmd mailbox */
   135          writel(~0U, slim_rproc->peri + SLIM_INT_CLR_OFST);
   136          writel(~0U, slim_rproc->peri + SLIM_CMD_CLR_OFST);
   137  
   138          /* enable all channels cmd & int */
   139          writel(~0U, slim_rproc->peri + SLIM_INT_MASK_OFST);
   140          writel(~0U, slim_rproc->peri + SLIM_CMD_MASK_OFST);
   141  
   142          /* enable cpu */
   143          writel(SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
   144  

	drivers/remoteproc/st_slim_rproc.c:170 slim_rproc_stop()
	warn: potential ! vs ~ typo

drivers/remoteproc/st_slim_rproc.c
   158  static int slim_rproc_stop(struct rproc *rproc)
   159  {
   160          struct st_slim_rproc *slim_rproc = rproc->priv;
   161          u32 val;
   162  
   163          /* mask all (cmd & int) channels */
   164          writel(0UL, slim_rproc->peri + SLIM_INT_MASK_OFST);
   165          writel(0UL, slim_rproc->peri + SLIM_CMD_MASK_OFST);
   166  
   167          /* disable cpu pipeline clock */
   168          writel(SLIM_CLK_GATE_DIS, slim_rproc->slimcore + SLIM_CLK_GATE_OFST);
   169  
   170          writel(!SLIM_EN_RUN, slim_rproc->slimcore + SLIM_EN_OFST);
                       ^^^^^^^^^^^^
Same.  SLIM_EN_RUN is BIT(0).

   171  
   172          val = readl(slim_rproc->slimcore + SLIM_EN_OFST);
   173          if (val & SLIM_EN_RUN)
   174                  dev_warn(&rproc->dev, "Failed to disable SLIM");
   175  
   176          dev_dbg(&rproc->dev, "slim stopped\n");
   177  
   178          return 0;
   179  }

regards,
dan carpenter
