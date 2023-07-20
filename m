Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84664EB64DA
	for <linux-remoteproc@archiver.kernel.org>; Thu, 20 Jul 2023 12:41:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjGTMlp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 20 Jul 2023 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbjGTMlo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 20 Jul 2023 08:41:44 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087FA2135;
        Thu, 20 Jul 2023 05:41:43 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 91534847C0;
        Thu, 20 Jul 2023 14:41:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689856901;
        bh=INDhtqyiSykAY67oAokr+tb9ev5bgGsqatnAm+/oJBQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dl7koUIgmsKt9yMfWl8eghCr0lCEoe/7ROgXGaIqCSuooDNhho+qsT6CQItNBf17l
         QAPfE6wp4Cp0wikeNSArSucsIpp2UI6ItD2Agk0FPkEOeU9ns+iJyXbBeTlRcdoaJf
         /mX0Mzc3c+P+Ribm+N8AILT4X/1KVuxdKRrXdd3rKPSenkeAYTWEU3ZKB4kq1kKmUu
         8jBgXEUfK6Byzws0yphzjFtekzNvwxjp0qU8wSOBCWQ9ww9kgpcPFaW4vb18hwyiMs
         UtbEPjcbJe2Vj02QvekyV5iatDyJIeYg3deHgDuqvho1Lbb0f111pnPOt28KVG0HR7
         GO1EaIhInDDew==
Message-ID: <9ccca5c8-73c5-e90c-52a4-df5ce4d02169@denx.de>
Date:   Thu, 20 Jul 2023 14:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] remoteproc: imx_rproc: Switch iMX8MN/MP from SMCCC to
 MMIO
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232626.374475-1-marex@denx.de>
 <20230707232626.374475-2-marex@denx.de> <ZLV16sCOX9gRJS+S@p14s>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ZLV16sCOX9gRJS+S@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/17/23 19:10, Mathieu Poirier wrote:
> Good morning,
> 
> On Sat, Jul 08, 2023 at 01:26:26AM +0200, Marek Vasut wrote:
>> The MX8M CM7 boot via SMC call is problematic, since not all versions
>> of ATF support this interface. Extend the MMIO support so it can boot
>> the CM7 on MX8MN/MP instead and discern the two alternatives using DT
>> compatible strings.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Conor Dooley <conor+dt@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-remoteproc@vger.kernel.org
>> ---
>>   drivers/remoteproc/imx_rproc.c | 53 ++++++++++++++++++++++++++++++++--
>>   drivers/remoteproc/imx_rproc.h |  2 ++
>>   2 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>> index d0eb96d6a4fe1..09589f664a2be 100644
>> --- a/drivers/remoteproc/imx_rproc.c
>> +++ b/drivers/remoteproc/imx_rproc.c
>> @@ -41,6 +41,12 @@
>>   #define IMX7D_M4_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST | \
>>   					 IMX7D_SW_M4C_NON_SCLR_RST)
>>   
>> +#define IMX8M_M7_STOP			(IMX7D_ENABLE_M4 | IMX7D_SW_M4C_RST)
>> +#define IMX8M_M7_POLL			IMX7D_ENABLE_M4
>> +
>> +#define IMX8M_GPR22			0x58
>> +#define IMX8M_GPR22_CM7_CPUWAIT		BIT(0)
>> +
>>   /* Address: 0x020D8000 */
>>   #define IMX6SX_SRC_SCR			0x00
>>   #define IMX6SX_ENABLE_M4		BIT(22)
>> @@ -92,6 +98,7 @@ static int imx_rproc_detach_pd(struct rproc *rproc);
>>   struct imx_rproc {
>>   	struct device			*dev;
>>   	struct regmap			*regmap;
>> +	struct regmap			*gpr;
>>   	struct rproc			*rproc;
>>   	const struct imx_rproc_dcfg	*dcfg;
>>   	struct imx_rproc_mem		mem[IMX_RPROC_MEM_MAX];
>> @@ -287,6 +294,18 @@ static const struct imx_rproc_att imx_rproc_att_imx6sx[] = {
>>   	{ 0x80000000, 0x80000000, 0x60000000, 0 },
>>   };
>>   
>> +static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn_mmio = {
>> +	.src_reg	= IMX7D_SRC_SCR,
>> +	.src_mask	= IMX7D_M4_RST_MASK,
>> +	.src_start	= IMX7D_M4_START,
>> +	.src_stop	= IMX8M_M7_STOP,
>> +	.gpr_reg	= IMX8M_GPR22,
>> +	.gpr_wait	= IMX8M_GPR22_CM7_CPUWAIT,
>> +	.att		= imx_rproc_att_imx8mn,
>> +	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>> +	.method		= IMX_RPROC_MMIO,
>> +};
>> +
>>   static const struct imx_rproc_dcfg imx_rproc_cfg_imx8mn = {
>>   	.att		= imx_rproc_att_imx8mn,
>>   	.att_size	= ARRAY_SIZE(imx_rproc_att_imx8mn),
>> @@ -367,8 +386,14 @@ static int imx_rproc_start(struct rproc *rproc)
>>   
>>   	switch (dcfg->method) {
>>   	case IMX_RPROC_MMIO:
>> -		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
>> -					 dcfg->src_start);
>> +		if (priv->gpr) {
>> +			ret = regmap_clear_bits(priv->gpr, dcfg->gpr_reg,
>> +						dcfg->gpr_wait);
>> +		} else {
>> +			ret = regmap_update_bits(priv->regmap, dcfg->src_reg,
>> +						 dcfg->src_mask,
>> +						 dcfg->src_start);
>> +		}
>>   		break;
>>   	case IMX_RPROC_SMC:
>>   		arm_smccc_smc(IMX_SIP_RPROC, IMX_SIP_RPROC_START, 0, 0, 0, 0, 0, 0, &res);
>> @@ -400,6 +425,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>>   
>>   	switch (dcfg->method) {
>>   	case IMX_RPROC_MMIO:
>> +		if (priv->gpr) {
>> +			ret = regmap_set_bits(priv->gpr, dcfg->gpr_reg,
>> +					      dcfg->gpr_wait);
>> +			if (ret) {
>> +				dev_err(priv->dev,
>> +					"Failed to quiescence M4 platform!\n");
>> +				return ret;
>> +			}
>> +		}
>> +
>>   		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
>>   					 dcfg->src_stop);
>>   		break;
>> @@ -988,6 +1023,10 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>   		break;
>>   	}
>>   
>> +	priv->gpr = syscon_regmap_lookup_by_phandle(dev->of_node, "gpr");
>> +	if (IS_ERR(priv->gpr))
>> +		priv->gpr = NULL;
>> +
>>   	regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
>>   	if (IS_ERR(regmap)) {
>>   		dev_err(dev, "failed to find syscon\n");
>> @@ -997,6 +1036,14 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>>   	priv->regmap = regmap;
>>   	regmap_attach_dev(dev, regmap, &config);
>>   
>> +	if (priv->gpr) {
>> +		ret = regmap_read(priv->gpr, dcfg->gpr_reg, &val);
>> +		if (val & dcfg->gpr_wait) {
>> +			imx_rproc_stop(priv->rproc);
>> +			return 0;
>> +		}
>> +	}
> 
> Can you provide a comment to explain what is happening above?  In what kind of
> scenario would a GPR be set with the wait bit on startup?

This happens right after power-on reset, the core indicates its in wait 
state in the GPR, but its not fully stopped, so we stop it and then the 
firmware can be loaded into it.
