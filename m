Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5A6EB64D9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 10 Jul 2023 16:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjGJQbF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 10 Jul 2023 12:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbjGJQbF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 10 Jul 2023 12:31:05 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0DC123;
        Mon, 10 Jul 2023 09:31:03 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BF3B9866BF;
        Mon, 10 Jul 2023 18:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1689006661;
        bh=g5iPEk5ffIEN1cPjeJDoPJ/MGkz/vg5kFPiwOJurMrI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=p4cPx9ZohZcbRoILENRkm0ul1WkNLqxbOv8c7X6F05yN/O9Y3M6dEU35vopcbsYCS
         SuHrH/zvdguLgneBJ5WBiEbZ2x7Dxzvs8ckki9ndMQgUcPjB4KlOg/bn6816l0ABSi
         EqNYr9AFApYllqfEWIvahT0LrwDq4HiQgMWx4+XFtr92x4rCxkjXyg/6la8+vwYyoH
         jsPLd/WbM3xEmCNdbpwbBvG7FPtTpeVpfveSgqH+NAgFpntOsKLUaK7+yml9LgTqBE
         ofN2nhYMoj+CK0Yplhcw4OmNbtapxE7UHZ03b1YGOFQPp31UO2KXUWLQipjoNGT20W
         +TUWS+p3GE0sQ==
Message-ID: <93c72991-2e7f-0d49-c2be-06fbe5904356@denx.de>
Date:   Mon, 10 Jul 2023 18:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] remoteproc: imx_rproc: add start up delay
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230707232444.374431-1-marex@denx.de>
 <20230707232444.374431-2-marex@denx.de> <ZKwpl1ZGJcX2RmJb@p14s>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <ZKwpl1ZGJcX2RmJb@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 7/10/23 17:53, Mathieu Poirier wrote:
> On Sat, Jul 08, 2023 at 01:24:44AM +0200, Marek Vasut wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> There is case that after remoteproc start remote processor[M4], the M4
>> runs slow and before M4 finish its own rpmsg framework initialization,
>> linux sends out vring kick message, then M4 firmware drops the kick
>> message. Some NXP released Cortex-M[x] images has such limitation that
>> it requires linux sends out vring kick message after M4 firmware finish
>> its rpmsg framework initialization.
>>
>> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
>> Reviewed-by: Ye Li <ye.li@nxp.com>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>> Note: picked from NXP downstream LF-6630-2 remoteproc: imx_rproc: add start up delay
>> https://github.com/nxp-imx/linux-imx.git 0b1b91c95b291a3b60d6224b13f6a95a75896abf
>> ---
>> Note: Literally all of the NXP BSP 2.13.0 firmware builds fail to boot
>>        without this being set to something like 50..500 ms , so this is
>>        rather useful to have.
> 
> My stance on this hasn't changed - hacks such as these do not scale and are a
> nightmare to maintain.  The problem should be fixed in the M4's firmware.

If the firmware cannot be updated, how do you propose that would be 
fixed in the firmware ?

Frankly, I do not see much of an issue in maintaining driver-specific 
mdelay().
