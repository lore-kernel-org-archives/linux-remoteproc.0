Return-Path: <SRS0=xJOp=EI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C8CC00A89
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 22:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09A6C206E5
	for <linux-remoteproc@archiver.kernel.org>; Mon,  2 Nov 2020 22:09:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nio365.onmicrosoft.com header.i=@nio365.onmicrosoft.com header.b="JDoYAPo4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgKBWJF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 17:09:05 -0500
Received: from mx0b-00010702.pphosted.com ([148.163.158.57]:25288 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725932AbgKBWJE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 17:09:04 -0500
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
        by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0A2M8oR4014985;
        Mon, 2 Nov 2020 16:08:52 -0600
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by mx0b-00010702.pphosted.com with ESMTP id 34h5r55226-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Nov 2020 16:08:51 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEIqtgwZRBRyKzTo+6dypYWOeZvB6I8MCi7Ipp6O6B1Xuc28Yx1R6P74Nd+P1hn8mjCVZfbnn13VRRFb65UfKuCc8E+QkKaaDc3oELZcLT3WG0Z8pepeUBOaiTS7gdB0vDfHaP3qeymJFJxDSE8eaHV+WVkeXNbjfjoSCYSQP7luZRD5xf5DL4wfcGNr19Sc0K6eKh7HE2Z7BDmqc4V+ntmu/dMpNunJ4LQhg7bg7/M9f5mk3IipP41Kn4e8QYuwSyAiX9g0oibqwI3COCDGjGtd9kJNzHdMnmCAopRdEf+A106Ws6R2Q+JttpmiJSHMfy+5d5Ez8IE9PnsMuuF2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMc0a96UQTkSL4AIpvn9HiIMnkg6ZskeIgw5Nm4vvVk=;
 b=EBI7wCj2NyRCnIWOoEArb0VlXHAlX3QPgC2j2p+eagfL/zqs8ABEGfPjHSeKk22yb9ZjX1OlAA3Av8pgnjqFQgN8L+jimycW/ujYAoMz7iVpoGj4W1142a3rQZOACS5W/X248Jc6gMyBcEmoH3WRS6FEFv1jvSXFXgXeH7My3q/H6tECKcWaRbIetLZ4EKeh04YBh5yYcVPHHxxDPMtSNAR7tk2hNaoV7WKTx6u7k/Kh/3WgFry7fVZ4Au0SIzd5rGAAHducF3yREgIQNt6L5H0NtNmtvH7/QmGTRnKktIPiB8LQtVhz/2tfrUNQ0C+b5yLKt84yueqMCdQHazV8hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMc0a96UQTkSL4AIpvn9HiIMnkg6ZskeIgw5Nm4vvVk=;
 b=JDoYAPo4e5uPkTs/1ek6JT2UyLshvOyJtqn9YGMEMu8OaeMpgsu85Qmy8yDVzz+FrYrJjUzOk+0UXUPyysPZGI7/yj3TULnusyFfADHasnRmup0hv5LTlPk3F77PAOvqCVOIbpf1p1dNy9dzOrjPyBD3AFl8xCMv+qogK2u9d7s=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=ni.com;
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com (10.167.141.157) by
 SN6PR04MB3935.namprd04.prod.outlook.com (52.135.86.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Mon, 2 Nov 2020 22:08:48 +0000
Received: from SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::9060:4872:8d22:a3b1]) by SN4PR0401MB3646.namprd04.prod.outlook.com
 ([fe80::9060:4872:8d22:a3b1%7]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 22:08:48 +0000
Date:   Mon, 2 Nov 2020 16:08:46 -0600
From:   Michael Auchter <michael.auchter@ni.com>
To:     Ben Levinsky <BLEVINSK@xilinx.com>
Cc:     Stefano Stabellini <stefanos@xilinx.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Message-ID: <20201102220846.GA79198@xaphan>
References: <20201102193859.31090-1-ben.levinsky@xilinx.com>
 <20201102193859.31090-6-ben.levinsky@xilinx.com>
 <20201102211333.GC6782@xaphan>
 <SN6PR02MB44160323EF1F88692AF337BAB5100@SN6PR02MB4416.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB44160323EF1F88692AF337BAB5100@SN6PR02MB4416.namprd02.prod.outlook.com>
X-Originating-IP: [136.49.33.116]
X-ClientProxiedBy: DM3PR12CA0107.namprd12.prod.outlook.com
 (2603:10b6:0:55::27) To SN4PR0401MB3646.namprd04.prod.outlook.com
 (2603:10b6:803:4b::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (136.49.33.116) by DM3PR12CA0107.namprd12.prod.outlook.com (2603:10b6:0:55::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Mon, 2 Nov 2020 22:08:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6efce5b1-0a43-4633-9ea5-08d87f7bdf5f
X-MS-TrafficTypeDiagnostic: SN6PR04MB3935:
X-Microsoft-Antispam-PRVS: <SN6PR04MB3935C4DBD77F8312C52E33C787100@SN6PR04MB3935.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ys5eIg241AiOSl8yumecP/sxO1D7dNgAjGNaoNq0Dev6G+oZ6ARccwe1NQiBxRNWjMhenAp0v5GRaRCWlxs2vxQVq6ATz2F04wPjYPJnEIt9rkxaMIr1DAVnoZq8haGfPysUBpumwQGtC9P/xjsNGUxrsj/GouYC4Btv0yxMPbxuTxEWq72P8oNzHaExtG4YFDw4qgH/D5qbTwxavsJgOqWs90KDxKQFgVOlHCgFqxaJjka9pGQCDFZJra6Vg93LcQqLJ3kuE5SPhnBGl5kkuR9QRQR2BMH+SpYN/UVHON2/8c/KVWbM3qTMvW1iaTC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3646.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(346002)(376002)(366004)(396003)(39860400002)(16526019)(26005)(52116002)(33716001)(44832011)(4326008)(478600001)(53546011)(6486002)(316002)(6916009)(54906003)(956004)(186003)(1076003)(66946007)(6496006)(2906002)(66476007)(66556008)(9686003)(83380400001)(8676002)(5660300002)(33656002)(30864003)(8936002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: wpm8pwDi4pBT8fKEajm3eYVp5oSS4qZ7EqVPy9Ycoif+zObmcZnBeI8IU4wwQ653PT2MfS675kEtMhwSTv+EljhJbvwVWQ4g8Mq3vogB4aXHUW+zKJwEdYlVHpd7yVT0zONug8E56AMAlb4P5LMIlHqJTIKjntaqrDDj0ytMsFZrI5zql10wuq0vxwfh9wneXq8ZLyIaPX1yTZbAPJz9dvxIxFSkZfFXG2gW2WcvqWW3w6Y9N+/6WhDsDIVgstKjQQF3tw7GtyvvxmbmIYLjFnypBiahQa8wg9SU06T0Kg+fBT9JIDKEEjtmVZwyGRkccLCqvbAbNlHudHJn2ivS/p69KCRy2D+LAzbE2VO7kcLRXJXADbZ3rA3MEy8lARIfuzoN30Mp4PRT6U3qqaTsrMUWQ6vqq1b+48oG5h8jX/Hraf6I1hKYXuGDNe+ghK04OYXsa9VJ/a6A81ml3dNiX+Rr2A3cLr3EuaGTgWWzKCO+jYsgwXgZWTMrP8R8/sd5h7XkLyItrd8WrbrTC4Tcnm3rbXj6XhSyTTnMBq2FSqbFuZmd4qedUH3ei43mDmGp71qO5TJ24UPJ1D4JJrThBq/MgNWqKg+rnlMrhmEuLDXLB59czH0d/iSc96e2AZ/3R8yjXVs/Gs8oMgtaTvSDFg==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efce5b1-0a43-4633-9ea5-08d87f7bdf5f
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3646.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 22:08:48.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFUiu8VShuAk7bJKT2WXvgKeL9+cWEskc8xdaSwDbYuxjV/XF2WRRZhr2QA/BwjCX8+2dPup95yslyHRIBObSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB3935
Subject: Re: RE: [PATCH v21 5/5] remoteproc: Add initial zynqmp R5 remoteproc driver
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-02_15:2020-11-02,2020-11-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 spamscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=7
 clxscore=1015 mlxscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011020168
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Nov 02, 2020 at 09:46:28PM +0000, Ben Levinsky wrote:
> Hi Michael,
> 
> > -----Original Message-----
> > From: Michael Auchter <michael.auchter@ni.com>
> > Sent: Monday, November 2, 2020 1:14 PM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: Stefano Stabellini <stefanos@xilinx.com>; mathieu.poirier@linaro.org;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v21 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> > driver
> > 
> > On Mon, Nov 02, 2020 at 11:38:59AM -0800, Ben Levinsky wrote:
> > > R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> > > remotproc driver, we can boot the R5 sub-system in different 2
> > > configurations -
> > > 	* split
> > > 	* lock-step
> > >
> > > The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> > > Platform Management Unit that handles the R5 configuration, memory
> > access
> > > and R5 lifecycle management. The interface to this manager is done in this
> > > driver via zynqmp_pm_* function calls.
> > >
> > > Signed-off-by: Wendy Liang <wendy.liang@xilinx.com>
> > > Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> > > Signed-off-by: Ed Mooring <ed.mooring@xilinx.com>
> > > Signed-off-by: Jason Wu <j.wu@xilinx.com>
> > > Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> > > ---
> > > Update Xilinx R5 Remoteproc Driver as follows:
> > > - update documentation for zynqmp_r5_probe
> > > - restructure so that cluster initialization code is all in one place
> > > - add memory allocation check for cluster
> > > - add error handling in case of second core fails at probe but first core
> > succeeded.
> > >   to clean up the first core
> > > - remove unneeded lines in zynqmp_r5_remoteproc_remove
> > > ---
> > >
> > >  drivers/remoteproc/Kconfig                |   8 +
> > >  drivers/remoteproc/Makefile               |   1 +
> > >  drivers/remoteproc/zynqmp_r5_remoteproc.c | 784
> > ++++++++++++++++++++++
> > >  3 files changed, 793 insertions(+)
> > >  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
> > >
> > > diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> > > index c6659dfea7c7..c2fe54b1d94f 100644
> > > --- a/drivers/remoteproc/Kconfig
> > > +++ b/drivers/remoteproc/Kconfig
> > > @@ -275,6 +275,14 @@ config TI_K3_DSP_REMOTEPROC
> > >  	  It's safe to say N here if you're not interested in utilizing
> > >  	  the DSP slave processors.
> > >
> > > +config ZYNQMP_R5_REMOTEPROC
> > > +	tristate "ZynqMP R5 remoteproc support"
> > > +	depends on PM && ARCH_ZYNQMP
> > > +	select RPMSG_VIRTIO
> > > +	select ZYNQMP_IPI_MBOX
> > > +	help
> > > +	  Say y or m here to support ZynqMP R5 remote processors via the
> > remote
> > > +	  processor framework.
> > >  endif # REMOTEPROC
> > >
> > >  endmenu
> > > diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> > > index 3dfa28e6c701..ef1abff654c2 100644
> > > --- a/drivers/remoteproc/Makefile
> > > +++ b/drivers/remoteproc/Makefile
> > > @@ -33,3 +33,4 @@ obj-$(CONFIG_ST_REMOTEPROC)		+=
> > st_remoteproc.o
> > >  obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
> > >  obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
> > >  obj-$(CONFIG_TI_K3_DSP_REMOTEPROC)	+= ti_k3_dsp_remoteproc.o
> > > +obj-$(CONFIG_ZYNQMP_R5_REMOTEPROC)	+= zynqmp_r5_remoteproc.o
> > > diff --git a/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > > new file mode 100644
> > > index 000000000000..993bd72e5664
> > > --- /dev/null
> > > +++ b/drivers/remoteproc/zynqmp_r5_remoteproc.c
> > > @@ -0,0 +1,784 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Zynq R5 Remote Processor driver
> > > + *
> > > + * Based on origin OMAP and Zynq Remote Processor driver
> > > + *
> > > + */
> > > +
> > > +#include <linux/firmware/xlnx-zynqmp.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mailbox_client.h>
> > > +#include <linux/mailbox/zynqmp-ipi-message.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of_address.h>
> > > +#include <linux/of_platform.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/remoteproc.h>
> > > +#include <linux/skbuff.h>
> > > +#include <linux/sysfs.h>
> > > +
> > > +#include "remoteproc_internal.h"
> > > +
> > > +#define MAX_RPROCS	2 /* Support up to 2 RPU */
> > > +#define MAX_MEM_PNODES	4 /* Max power nodes for one RPU memory
> > instance */
> > > +
> > > +#define BANK_LIST_PROP	"meta-memory-regions"
> > > +#define DDR_LIST_PROP	"memory-regions"
> > > +
> > > +/* IPI buffer MAX length */
> > > +#define IPI_BUF_LEN_MAX	32U
> > > +/* RX mailbox client buffer max length */
> > > +#define RX_MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
> > > +				 sizeof(struct zynqmp_ipi_message))
> > > +
> > > +/**
> > > + * struct zynqmp_r5_mem - zynqmp rpu memory data
> > > + * @pnode_id: TCM power domain ids
> > > + * @res: memory resource
> > > + * @node: list node
> > > + */
> > > +struct zynqmp_r5_mem {
> > > +	u32 pnode_id[MAX_MEM_PNODES];
> > > +	struct resource res;
> > > +	struct list_head node;
> > > +};
> > > +
> > > +/**
> > > + * struct zynqmp_r5_rproc - zynqmp rpu remote processor state
> > > + *			    this is for each individual R5 core's state
> > > + *
> > > + * @rx_mc_buf: rx mailbox client buffer to save the rx message
> > > + * @tx_mc: tx mailbox client
> > > + * @rx_mc: rx mailbox client * @dev: device of RPU instance
> > > + * @mbox_work: mbox_work for the RPU remoteproc
> > > + * @tx_mc_skbs: socket buffers for tx mailbox client
> > > + * @dev: device of RPU instance
> > > + * @rproc: rproc handle
> > > + * @tx_chan: tx mailbox channel
> > > + * @rx_chan: rx mailbox channel
> > > + * @pnode_id: RPU CPU power domain id
> > > + * @elem: linked list item
> > > + * @dt_node: device tree node that holds information for 1 R5 core.
> > > + */
> > > +struct zynqmp_r5_rproc {
> > > +	unsigned char rx_mc_buf[RX_MBOX_CLIENT_BUF_MAX];
> > > +	struct mbox_client tx_mc;
> > > +	struct mbox_client rx_mc;
> > > +	struct work_struct mbox_work;
> > > +	struct sk_buff_head tx_mc_skbs;
> > > +	struct device *dev;
> > > +	struct rproc *rproc;
> > > +	struct mbox_chan *tx_chan;
> > > +	struct mbox_chan *rx_chan;
> > > +	u32 pnode_id;
> > > +	struct list_head elem;
> > > +};
> > > +
> > > +/*
> > > + * r5_set_mode - set RPU operation mode
> > > + * @z_rproc: Remote processor private data
> > > + * @rpu_mode: mode specified by device tree to configure the RPU to
> > > + *
> > > + * set RPU operation mode
> > > + *
> > > + * Return: 0 for success, negative value for failure
> > > + */
> > > +static int r5_set_mode(struct zynqmp_r5_rproc *z_rproc,
> > > +		       enum rpu_oper_mode rpu_mode)
> > > +{
> > > +	enum rpu_tcm_comb tcm_mode;
> > > +	enum rpu_oper_mode cur_rpu_mode;
> > > +	int ret;
> > > +
> > > +	ret = zynqmp_pm_get_rpu_mode(z_rproc->pnode_id,
> > &cur_rpu_mode);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	if (rpu_mode != cur_rpu_mode) {
> > > +		ret = zynqmp_pm_set_rpu_mode(z_rproc->pnode_id,
> > > +					     rpu_mode);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > > +	tcm_mode = (rpu_mode == PM_RPU_MODE_LOCKSTEP) ?
> > > +		    PM_RPU_TCM_COMB : PM_RPU_TCM_SPLIT;
> > > +	return zynqmp_pm_set_tcm_config(z_rproc->pnode_id, tcm_mode);
> > > +}
> > > +
> > > +/*
> > > + * release TCM banks when powering down R5 core
> > > + */
> > > +static int tcm_mem_release(struct rproc *rproc, struct rproc_mem_entry
> > *mem)
> > > +{
> > > +	u32 pnode_id = (u64)mem->priv;
> > > +
> > > +	iounmap(mem->va);
> > > +	return zynqmp_pm_release_node(pnode_id);
> > > +}
> > > +
> > > +/*
> > > + * given ID corresponding to R5 core in Xilinx Platform management (xpm)
> > API,
> > > + * try to use xpm wake call to wake R5 core
> > > + */
> > > +static int zynqmp_r5_rproc_start(struct rproc *rproc)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > +	enum rpu_boot_mem bootmem;
> > > +
> > > +	bootmem = (rproc->bootaddr & 0xF0000000) == 0xF0000000 ?
> > > +		  PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> > > +
> > > +	dev_dbg(rproc->dev.parent, "RPU boot from %s.",
> > > +		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> > > +
> > > +	return zynqmp_pm_request_wake(z_rproc->pnode_id, 1,
> > > +				     bootmem,
> > ZYNQMP_PM_REQUEST_ACK_NO);
> > > +}
> > > +
> > > +/*
> > > + * given ID corresponding to R5 core in Xilinx Platform management (xpm)
> > API,
> > > + * try to use xpm power down call to power off R5 core
> > > + */
> > > +static int zynqmp_r5_rproc_stop(struct rproc *rproc)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > +
> > > +	return zynqmp_pm_force_pwrdwn(z_rproc->pnode_id,
> > > +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > +}
> > > +
> > > +/*
> > > + * map in physical addr for  DDR mem carveout in rproc
> > > + */
> > > +static int zynqmp_r5_rproc_mem_alloc(struct rproc *rproc,
> > > +				     struct rproc_mem_entry *mem)
> > > +{
> > > +	void *va;
> > > +
> > > +	va = ioremap_wc(mem->dma, mem->len);
> > > +	if (IS_ERR_OR_NULL(va))
> > > +		return -ENOMEM;
> > > +
> > > +	/* Update memory entry va */
> > > +	mem->va = va;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* unmap rproc_mem_entry virtual addr */
> > > +static int zynqmp_r5_rproc_mem_release(struct rproc *rproc,
> > > +				       struct rproc_mem_entry *mem)
> > > +{
> > > +	iounmap(mem->va);
> > > +	return 0;
> > > +}
> > > +
> > > +/* construct rproc mem carveouts for DDR regions specified in device tree
> > */
> > > +static int parse_mem_regions(struct rproc *rproc)
> > > +{
> > > +	int num_mems, i;
> > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > +	struct device *dev = &rproc->dev;
> > > +	struct device_node *np = z_rproc->dev->of_node;
> > > +	struct rproc_mem_entry *mem;
> > > +
> > > +	num_mems = of_count_phandle_with_args(np, DDR_LIST_PROP,
> > NULL);
> > > +	if (num_mems <= 0)
> > > +		return 0;
> > > +
> > > +	for (i = 0; i < num_mems; i++) {
> > > +		struct device_node *node;
> > > +		struct reserved_mem *rmem;
> > > +
> > > +		node = of_parse_phandle(np, DDR_LIST_PROP, i);
> > > +		if (!node)
> > > +			return -EINVAL;
> > > +
> > > +		rmem = of_reserved_mem_lookup(node);
> > > +		if (!rmem)
> > > +			return -EINVAL;
> > > +
> > > +		if (strstr(node->name, "vdev0vring")) {
> > > +			int vring_id;
> > > +			char name[16];
> > > +
> > > +			/*
> > > +			 * expecting form of "rpuXvdev0vringX as documented
> > > +			 * in xilinx remoteproc device tree binding
> > > +			 */
> > > +			if (strlen(node->name) < 15) {
> > > +				dev_err(dev, "%pOF is less than 14 chars",
> > > +					node);
> > > +				return -EINVAL;
> > > +			}
> > > +
> > > +			/*
> > > +			 * can be 1 of multiple vring IDs per IPC channel
> > > +			 * e.g. 'vdev0vring0' and 'vdev0vring1'
> > > +			 */
> > > +			vring_id = node->name[14] - '0';
> > > +			snprintf(name, sizeof(name), "vdev0vring%d",
> > vring_id);
> > > +			/* Register vring */
> > > +			mem = rproc_mem_entry_init(dev, NULL,
> > > +						   (dma_addr_t)rmem->base,
> > > +						   rmem->size, rmem->base,
> > > +
> > zynqmp_r5_rproc_mem_alloc,
> > > +
> > zynqmp_r5_rproc_mem_release,
> > > +						   name);
> > > +		} else {
> > > +			/* Register DMA region */
> > > +			int (*alloc)(struct rproc *r,
> > > +				     struct rproc_mem_entry *rme);
> > > +			int (*release)(struct rproc *r,
> > > +				       struct rproc_mem_entry *rme);
> > > +			char name[20];
> > > +
> > > +			if (strstr(node->name, "vdev0buffer")) {
> > > +				alloc = NULL;
> > > +				release = NULL;
> > > +				strcpy(name, "vdev0buffer");
> > > +			} else {
> > > +				alloc = zynqmp_r5_rproc_mem_alloc;
> > > +				release = zynqmp_r5_rproc_mem_release;
> > > +				strcpy(name, node->name);
> > > +			}
> > > +
> > > +			mem = rproc_mem_entry_init(dev, NULL,
> > > +						   (dma_addr_t)rmem->base,
> > > +						   rmem->size, rmem->base,
> > > +						   alloc, release, name);
> > > +		}
> > > +		if (!mem)
> > > +			return -ENOMEM;
> > > +
> > > +		rproc_add_carveout(rproc, mem);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/* call Xilinx Platform manager to request access to TCM bank */
> > > +static int zynqmp_r5_pm_request_tcm(struct device_node *tcm_node,
> > > +				    struct device *dev, u32 *pnode_id)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = of_property_read_u32(tcm_node, "pnode-id", pnode_id);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return zynqmp_pm_request_node(*pnode_id,
> > ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> > > +				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> > > +}
> > > +
> > > +/*
> > > + * Given TCM bank entry,
> > > + * this callback will set device address for R5 running on TCM
> > > + * and also setup virtual address for TCM bank remoteproc carveout
> > > + */
> > > +static int tcm_mem_alloc(struct rproc *rproc,
> > > +			 struct rproc_mem_entry *mem)
> > > +{
> > > +	void *va;
> > > +	struct device *dev = rproc->dev.parent;
> > > +
> > > +	va = ioremap_wc(mem->dma, mem->len);
> > > +	if (IS_ERR_OR_NULL(va))
> > > +		return -ENOMEM;
> > > +
> > > +	/* Update memory entry va */
> > > +	mem->va = va;
> > > +
> > > +	va = devm_ioremap_wc(dev, mem->da, mem->len);
> > > +	if (!va)
> > > +		return -ENOMEM;
> > > +	/* As R5 is 32 bit, wipe out extra high bits */
> > > +	mem->da &= 0x000fffff;
> > > +	/*
> > > +	 * TCM Banks 0A and 0B (0xffe00000 and 0xffe20000)
> > > +	 * are handled with the above line of code so do nothing
> > > +	 * for this 2 banks
> > > +	 */
> > > +
> > > +	/*
> > > +	 * TCM Banks 1A and 1B (0xffe90000 and 0xffeb0000) still
> > > +	 * need to be translated to 0x0 and 0x20000
> > > +	 */
> > > +	if (mem->da == 0x90000 || mem->da == 0xB0000)
> > > +		mem->da -= 0x90000;
> > > +
> > > +	/* if translated TCM bank address is not valid report error */
> > > +	if (mem->da != 0x0 && mem->da != 0x20000) {
> > > +		dev_err(dev, "invalid TCM bank address: %x\n", mem->da);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * Given R5 node in remoteproc instance
> > > + * allocate remoteproc carveout for TCM memory
> > > + * needed for firmware to be loaded
> > > + */
> > > +static int parse_tcm_banks(struct rproc *rproc)
> > > +{
> > > +	int i, num_banks;
> > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > +	struct device *dev = &rproc->dev;
> > > +	struct device_node *r5_node = z_rproc->dev->of_node;
> > > +
> > > +	/* go through TCM banks for r5 node */
> > > +	num_banks = of_count_phandle_with_args(r5_node,
> > BANK_LIST_PROP, NULL);
> > > +	if (num_banks <= 0) {
> > > +		dev_err(dev, "need to specify TCM banks\n");
> > > +		return -EINVAL;
> > > +	}
> > > +	for (i = 0; i < num_banks; i++) {
> > > +		struct resource rsc;
> > > +		resource_size_t size;
> > > +		struct device_node *dt_node;
> > > +		struct rproc_mem_entry *mem;
> > > +		int ret;
> > > +		u32 pnode_id; /* zynqmp_pm* fn's expect u32 */
> > > +
> > > +		dt_node = of_parse_phandle(r5_node, BANK_LIST_PROP, i);
> > > +		if (!dt_node)
> > > +			return -EINVAL;
> > > +
> > > +		if (of_device_is_available(dt_node)) {
> > > +			ret = of_address_to_resource(dt_node, 0, &rsc);
> > > +			if (ret < 0)
> > > +				return ret;
> > > +
> > > +			ret = zynqmp_r5_pm_request_tcm(dt_node, dev,
> > &pnode_id);
> > > +			if (ret < 0)
> > > +				return ret;
> > > +
> > > +			/* add carveout */
> > > +			size = resource_size(&rsc);
> > > +			mem = rproc_mem_entry_init(dev, NULL, rsc.start,
> > > +						   (int)size, rsc.start,
> > > +						   tcm_mem_alloc,
> > > +						   tcm_mem_release,
> > > +						   rsc.name);
> > > +			if (!mem)
> > > +				return -ENOMEM;
> > > +
> > > +			mem->priv = (void *)(u64)pnode_id;
> > > +			rproc_add_carveout(rproc, mem);
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/*
> > > + * when loading firmware, load in needed DDR, TCM memory regions and
> > wire
> > > + * these into remoteproc core's carveouts
> > > + */
> > > +static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware
> > *fw)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = parse_tcm_banks(rproc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = parse_mem_regions(rproc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = rproc_elf_load_rsc_table(rproc, fw);
> > > +	if (ret == -EINVAL) {
> > > +		/*
> > > +		 * resource table only required for IPC.
> > > +		 * if not present, this is not necessarily an error;
> > > +		 * for example, loading r5 hello world application
> > > +		 * so simply inform user and keep going.
> > > +		 */
> > > +		dev_info(&rproc->dev, "no resource table found.\n");
> > > +		ret = 0;
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +/* kick a firmware */
> > > +static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
> > > +{
> > > +	struct sk_buff *skb;
> > > +	unsigned int skb_len;
> > > +	struct zynqmp_ipi_message *mb_msg;
> > > +	int ret;
> > > +
> > > +	struct device *dev = rproc->dev.parent;
> > > +	struct zynqmp_r5_rproc *z_rproc = rproc->priv;
> > > +
> > > +	skb_len = (unsigned int)(sizeof(vqid) + sizeof(mb_msg));
> > > +	skb = alloc_skb(skb_len, GFP_ATOMIC);
> > > +	if (!skb)
> > > +		return;
> > > +
> > > +	mb_msg = (struct zynqmp_ipi_message *)skb_put(skb, skb_len);
> > > +	mb_msg->len = sizeof(vqid);
> > > +	memcpy(mb_msg->data, &vqid, sizeof(vqid));
> > > +	skb_queue_tail(&z_rproc->tx_mc_skbs, skb);
> > > +	ret = mbox_send_message(z_rproc->tx_chan, mb_msg);
> > > +	if (ret < 0) {
> > > +		dev_warn(dev, "Failed to kick remote.\n");
> > > +		skb_dequeue_tail(&z_rproc->tx_mc_skbs);
> > > +		kfree_skb(skb);
> > > +	}
> > > +}
> > > +
> > > +static struct rproc_ops zynqmp_r5_rproc_ops = {
> > > +	.start		= zynqmp_r5_rproc_start,
> > > +	.stop		= zynqmp_r5_rproc_stop,
> > > +	.load		= rproc_elf_load_segments,
> > > +	.parse_fw	= zynqmp_r5_parse_fw,
> > > +	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> > > +	.sanity_check	= rproc_elf_sanity_check,
> > > +	.get_boot_addr	= rproc_elf_get_boot_addr,
> > > +	.kick		= zynqmp_r5_rproc_kick,
> > > +};
> > > +
> > > +/**
> > > + * event_notified_idr_cb() - event notified idr callback
> > > + * @id: idr id
> > > + * @ptr: pointer to idr private data
> > > + * @data: data passed to idr_for_each callback
> > > + *
> > > + * Pass notification to remoteproc virtio
> > > + *
> > > + * Return: 0. having return is to satisfy the idr_for_each() function
> > > + *          pointer input argument requirement.
> > > + **/
> > > +static int event_notified_idr_cb(int id, void *ptr, void *data)
> > > +{
> > > +	struct rproc *rproc = data;
> > > +
> > > +	(void)rproc_vq_interrupt(rproc, id);
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * handle_event_notified() - remoteproc notification work funciton
> > > + * @work: pointer to the work structure
> > > + *
> > > + * It checks each registered remoteproc notify IDs.
> > > + */
> > > +static void handle_event_notified(struct work_struct *work)
> > > +{
> > > +	struct rproc *rproc;
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +
> > > +	z_rproc = container_of(work, struct zynqmp_r5_rproc, mbox_work);
> > > +
> > > +	(void)mbox_send_message(z_rproc->rx_chan, NULL);
> > > +	rproc = z_rproc->rproc;
> > > +	/*
> > > +	 * We only use IPI for interrupt. The firmware side may or may
> > > +	 * not write the notifyid when it trigger IPI.
> > > +	 * And thus, we scan through all the registered notifyids.
> > > +	 */
> > > +	idr_for_each(&rproc->notifyids, event_notified_idr_cb, rproc);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_mb_rx_cb() - Receive channel mailbox callback
> > > + * @cl: mailbox client
> > > + * @mssg: message pointer
> > > + *
> > > + * It will schedule the R5 notification work.
> > > + */
> > > +static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *mssg)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +
> > > +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, rx_mc);
> > > +	if (mssg) {
> > > +		struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> > > +		size_t len;
> > > +
> > > +		ipi_msg = (struct zynqmp_ipi_message *)mssg;
> > > +		buf_msg = (struct zynqmp_ipi_message *)z_rproc->rx_mc_buf;
> > > +		len = (ipi_msg->len >= IPI_BUF_LEN_MAX) ?
> > > +		      IPI_BUF_LEN_MAX : ipi_msg->len;
> > > +		buf_msg->len = len;
> > > +		memcpy(buf_msg->data, ipi_msg->data, len);
> > > +	}
> > > +	schedule_work(&z_rproc->mbox_work);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_mb_tx_done() - Request has been sent to the remote
> > > + * @cl: mailbox client
> > > + * @mssg: pointer to the message which has been sent
> > > + * @r: status of last TX - OK or error
> > > + *
> > > + * It will be called by the mailbox framework when the last TX has done.
> > > + */
> > > +static void zynqmp_r5_mb_tx_done(struct mbox_client *cl, void *mssg, int
> > r)
> > > +{
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +	struct sk_buff *skb;
> > > +
> > > +	if (!mssg)
> > > +		return;
> > > +	z_rproc = container_of(cl, struct zynqmp_r5_rproc, tx_mc);
> > > +	skb = skb_dequeue(&z_rproc->tx_mc_skbs);
> > > +	kfree_skb(skb);
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_setup_mbox() - Setup mailboxes
> > > + *			    this is used for each individual R5 core
> > > + *
> > > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > > + * @node: pointer of the device node
> > > + *
> > > + * Function to setup mailboxes to talk to RPU.
> > > + *
> > > + * Return: 0 for success, negative value for failure.
> > > + */
> > > +static int zynqmp_r5_setup_mbox(struct zynqmp_r5_rproc *z_rproc,
> > > +				struct device_node *node)
> > > +{
> > > +	struct mbox_client *mclient;
> > > +
> > > +	/* Setup TX mailbox channel client */
> > > +	mclient = &z_rproc->tx_mc;
> > > +	mclient->rx_callback = NULL;
> > > +	mclient->tx_block = false;
> > > +	mclient->knows_txdone = false;
> > > +	mclient->tx_done = zynqmp_r5_mb_tx_done;
> > > +	mclient->dev = z_rproc->dev;
> > > +
> > > +	/* Setup TX mailbox channel client */
> > > +	mclient = &z_rproc->rx_mc;
> > > +	mclient->dev = z_rproc->dev;
> > > +	mclient->rx_callback = zynqmp_r5_mb_rx_cb;
> > > +	mclient->tx_block = false;
> > > +	mclient->knows_txdone = false;
> > > +
> > > +	INIT_WORK(&z_rproc->mbox_work, handle_event_notified);
> > > +
> > > +	/* Request TX and RX channels */
> > > +	z_rproc->tx_chan = mbox_request_channel_byname(&z_rproc-
> > >tx_mc, "tx");
> > > +	if (IS_ERR(z_rproc->tx_chan)) {
> > > +		dev_err(z_rproc->dev, "failed to request mbox tx channel.\n");
> > > +		z_rproc->tx_chan = NULL;
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	z_rproc->rx_chan = mbox_request_channel_byname(&z_rproc-
> > >rx_mc, "rx");
> > > +	if (IS_ERR(z_rproc->rx_chan)) {
> > > +		dev_err(z_rproc->dev, "failed to request mbox rx channel.\n");
> > > +		z_rproc->rx_chan = NULL;
> > > +		return -EINVAL;
> > > +	}
> > > +	skb_queue_head_init(&z_rproc->tx_mc_skbs);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +/**
> > > + * zynqmp_r5_probe() - Probes ZynqMP R5 processor device node
> > > + *		       this is called for each individual R5 core to
> > > + *		       set up mailbox, Xilinx platform manager unique ID,
> > > + *		       add to rproc core
> > > + *
> > > + * @z_rproc: pointer to the ZynqMP R5 processor platform data
> > > + * @pdev: domain platform device for current R5 core
> > > + * @node: pointer of the device node for current R5 core
> > > + * @rpu_mode: mode to configure RPU, split or lockstep
> > > + * @core: Xilinx specific remoteproc structure used later to link
> > > + *           in to cluster of cores
> > 
> > This still does not match the param list (there's no z_rproc)
> > 
> Isn't core in this context the z_rproc? I can change the argument name if that is what you mean

The doc lists 5 arguments (z_rproc, pdev, node, rpu_mode, core), but the
function takes 4 arguments (pdev, node, rpu_mode, core).

> > > + *
> > > + * Function to retrieve the information of the ZynqMP R5 device node.
> > > + *
> > > + * Return: 0 for success, negative value for failure.
> > > + */
> > > +static int zynqmp_r5_probe(struct platform_device *pdev,
> > > +			   struct device_node *node,
> > > +			   enum rpu_oper_mode rpu_mode,
> > > +			   struct zynqmp_r5_rproc **core)
> > > +{
> > > +	int ret;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct rproc *rproc_ptr;
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +
> > > +	/* Allocate remoteproc instance */
> > > +	/* dev here is parent device of the allocated rproc's dev field */
> > > +	rproc_ptr = rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
> > > +				NULL, sizeof(struct zynqmp_r5_rproc));
> > > +	if (!rproc_ptr)
> > > +		return -ENOMEM;
> > > +	z_rproc = rproc_ptr->priv;
> > > +	z_rproc->rproc = rproc_ptr;
> > > +	z_rproc->dev = dev;
> > > +	/* Set up DMA mask */
> > > +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> > > +	if (ret)
> > > +		goto error;
> > > +	/* Get R5 power domain node */
> > > +	ret = of_property_read_u32(node, "pnode-id", &z_rproc->pnode_id);
> > > +	if (ret)
> > > +		goto error;
> > > +
> > > +	ret = r5_set_mode(z_rproc, rpu_mode);
> 	> > +	if (ret)
> > > +		return ret;
> > 
> > goto error?
> > 
> Ok will change
> > > +
> > > +	if (of_property_read_bool(node, "mboxes")) {
> > > +		ret = zynqmp_r5_setup_mbox(z_rproc, node);
> > > +		if (ret)
> > > +			goto error;
> > > +	}
> > > +	/* Add R5 remoteproc */
> > > +	ret = rproc_add(rproc_ptr);
> > > +	if (ret)
> > > +		goto error;
> > > +	*core = z_rproc;
> > > +
> > > +	return 0;
> > > +error:
> > > +	if (z_rproc->rproc)
> > 
> > How would this ever be NULL?
> Ok will change
> > 
> > > +		rproc_free(z_rproc->rproc);
> > > +	z_rproc->rproc = NULL;
> > 
> > This looks like another use-after-free, but it also seems unnecessary.
> Ok will change
> > 
> > > +	return ret;
> > > +}
> > > +
> > > +/*
> > > + * called when driver is probed, for each R5 core specified in DT,
> > > + * setup as needed to do remoteproc-related operations
> > > + */
> > > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > +{
> > > +	int ret, i;
> > > +	struct device *dev = &pdev->dev;
> > > +	struct device_node *nc;
> > > +	enum rpu_oper_mode rpu_mode;
> > > +	struct list_head *cluster; /* list to track each core's rproc */
> > > +	struct zynqmp_r5_rproc *z_rproc;
> > > +	struct platform_device *child_pdev;
> > > +
> > > +	rpu_mode = of_property_read_bool(dev->of_node, "lockstep-mode")
> > ?
> > > +		   PM_RPU_MODE_LOCKSTEP : PM_RPU_MODE_SPLIT;
> > > +	dev_dbg(dev, "RPU configuration: %s\n",
> > > +		rpu_mode == PM_RPU_MODE_LOCKSTEP ? "lockstep" :
> > "split");
> > > +
> > > +	/*
> > > +	 * if 2 RPUs provided but one is lockstep, then we have an
> > > +	 * invalid configuration.
> > > +	 */
> > > +	i = of_get_available_child_count(dev->of_node);
> > > +	if ((rpu_mode == PM_RPU_MODE_LOCKSTEP && i != 1) || i >
> > MAX_RPROCS)
> > > +		return -EINVAL;
> > > +
> > > +	cluster = devm_kzalloc(dev, sizeof(*cluster), GFP_KERNEL);
> > > +	if (!cluster)
> > > +		return -ENOMEM;
> > > +	INIT_LIST_HEAD(cluster);
> > > +
> > > +	ret = devm_of_platform_populate(dev);
> > > +	if (ret) {
> > > +		dev_err(dev, "devm_of_platform_populate failed, ret =
> > %d\n",
> > > +			ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	/* probe each individual r5 core's remoteproc-related info */
> > > +	i = 0;
> > > +	for_each_available_child_of_node(dev->of_node, nc) {
> > > +		child_pdev = of_find_device_by_node(nc);
> > > +		if (!child_pdev) {
> > > +			dev_err(dev, "could not get R5 core platform
> > device\n");
> > > +			ret = -ENODEV;
> > > +			goto out;
> > > +		}
> > > +		ret = zynqmp_r5_probe(child_pdev, nc, rpu_mode, &z_rproc);
> > > +		dev_dbg(dev, "%s to probe rpu %pOF\n",
> > > +			ret ? "Failed" : "Able",
> > > +			nc);
> > > +		if (!z_rproc)
> > > +			ret = -EINVAL;
> > > +		if (ret)
> > > +			goto out;
> > > +
> > > +		list_add_tail(&z_rproc->elem, cluster);
> > > +		i++;
> > > +	}
> > > +	/* wire in so each core can be cleaned up at drive remove */
> > > +	platform_set_drvdata(pdev, cluster);
> > > +	ret = 0;
> > 
> > Just return 0 here instead of resetting ret.
> Ok will change
> > 
> > > +out:
> > > +	/* undo core0 upon any failures on core1 in split-mode */
> > > +	if (rpu_mode == PM_RPU_MODE_SPLIT && i == 1 && ret != 0) {
> > > +		z_rproc = container_of(cluster, struct zynqmp_r5_rproc,
> > elem);
> > 
> > This looks very wrong to me; cluster isn't a pointer to member of
> > zynqmp_r5_rproc. Was this path tested?
> > 
> It was tested and ran, but Ok will change
> > > +		if (z_rproc->rproc) {
> > 
> > How would z_rproc->rproc be NULL here?
> 
> Good point, will remove this check
> > 
> > > +			rproc_del(z_rproc->rproc);
> > > +			rproc_free(z_rproc->rproc);
> > > +		}
> > > +
> > > +		if (z_rproc->tx_chan)
> > > +			mbox_free_channel(z_rproc->tx_chan);
> > > +		if (z_rproc->rx_chan)
> > > +			mbox_free_channel(z_rproc->rx_chan);
> > 
> > Again, this looks like a use-after-free.
> > 
> Ok will change
> > > +	}
> > > +	return ret;
> > > +}
> > > +
> > > +/*
> > > + * for each core, clean up the following:
> > > + *	single rproc entry
> > > + *	mailbox tx, rx
> > > + */
> > > +static int zynqmp_r5_remoteproc_remove(struct platform_device *pdev)
> > > +{
> > > +	struct list_head *pos, *cluster = (struct list_head *)
> > > +					  platform_get_drvdata(pdev);
> > > +	struct zynqmp_r5_rproc *z_rproc = NULL;
> > > +	struct rproc *rproc = NULL;
> > > +
> > > +	list_for_each(pos, cluster) {
> > > +		z_rproc = list_entry(pos, struct zynqmp_r5_rproc, elem);
> > > +		rproc = z_rproc->rproc;
> > > +		if (rproc) {
> > > +			rproc_del(rproc);
> > > +			rproc_free(rproc);
> > > +		}
> > > +
> > > +		if (z_rproc->tx_chan)
> > > +			mbox_free_channel(z_rproc->tx_chan);
> > > +		if (z_rproc->rx_chan)
> > > +			mbox_free_channel(z_rproc->rx_chan);
> > 
> > The use-after-free issue I pointed out on v20 is still present here (and
> > has now been replicated in probe() as well).
> > 
> So for this and the other mbox_free_channel call, is it alright to
> check if the mbox property is in the z_rproc pointer's dev->of_node?
> If so then the setup_mbox was called and ran ok if the driver got this
> far.
> E.g.	 if (of_property_read_bool(z_rproc->dev->of_node, "mboxes")) {

I'm not sure if I understand what you're proposing here... but to me,
the most obvious way to fix a use-after-free is to not free the memory
until you're actually done using it. Moving the rproc_free until the
end of this block would accomplish that.

> 
> [...]
> 
> Thanks
> Ben
