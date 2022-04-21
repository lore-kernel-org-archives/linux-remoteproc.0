Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F54AC43219
	for <linux-remoteproc@archiver.kernel.org>; Thu, 21 Apr 2022 06:51:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385245AbiDUGyQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 21 Apr 2022 02:54:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386059AbiDUGyA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Apr 2022 02:54:00 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1ED8EB37;
        Wed, 20 Apr 2022 23:51:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 704FC8106;
        Thu, 21 Apr 2022 06:48:20 +0000 (UTC)
Date:   Thu, 21 Apr 2022 09:51:10 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     linux-kernel@vger.kernel.org, nm@ti.com,
        devicetree@vger.kernel.org, grygorii.strashko@ti.com,
        vigneshr@ti.com, mathieu.poirier@linaro.org, kishon@ti.com,
        linux-remoteproc@vger.kernel.org, bjorn.andersson@linaro.org,
        rogerq@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/6] soc: ti: pruss: Add helper function to enable OCP
 master ports
Message-ID: <YmD+3svXUIHiX6DJ@atomide.com>
References: <20220418123004.9332-1-p-mohan@ti.com>
 <20220418123004.9332-6-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418123004.9332-6-p-mohan@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

* Puranjay Mohan <p-mohan@ti.com> [220418 12:35]:
> From: Suman Anna <s-anna@ti.com>
> +/**
> + * pruss_cfg_ocp_master_ports() - configure PRUSS OCP master ports
> + * @pruss: the pruss instance handle
> + * @enable: set to true for enabling or false for disabling the OCP master ports
> + *
> + * This function programs the PRUSS_SYSCFG.STANDBY_INIT bit either to enable or
> + * disable the OCP master ports (applicable only on SoCs using OCP interconnect
> + * like the OMAP family). Clearing the bit achieves dual functionalities - one
> + * is to deassert the MStandby signal to the device PRCM, and the other is to
> + * enable OCP master ports to allow accesses outside of the PRU-ICSS. The
> + * function has to wait for the PRCM to acknowledge through the monitoring of
> + * the PRUSS_SYSCFG.SUB_MWAIT bit when enabling master ports. Setting the bit
> + * disables the master access, and also signals the PRCM that the PRUSS is ready
> + * for Standby.

Looks OK to me, some comments regarding runtime PM though for future patching
though.

Eventually we may want to handle this in drivers/bus/ti-sysc.c so it gets toggled
based on runtime PM. The PRUSS sysc register seems to be just a new variant of
sysc_regbits_omap4_simple with the standby and status bits added.

If using runtime PM for the PRUSS instance is not suitable for managing the
standby and status bits, then some comments should be added describing why
finer grained control is needed for these bits beyond runtime PM.

As far as I'm concerned, these can be done in separate changes, no need to update
this patch.

Regards,

Tony
