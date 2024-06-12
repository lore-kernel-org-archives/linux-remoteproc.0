Received: from mx1.t-argos.ru (mx1.t-argos.ru [109.73.34.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549AE17B4F1;
	Wed, 12 Jun 2024 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.73.34.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198725; cv=none; b=qtlfriBF0ZdYlygGunrTjS8NKnfuzZptHb4GCEGkXK6lhJfTfei/9wF5pdO+GMaNLABR3Lq4uf/bToQsQP3xaZ1yVRiB7SxtKE7VidEoKJZQ9gpMj+Bt7xPcs0fGQE5JlwV6KCLd57ZFRfPfOfEw57dFYe+NIGYR+GvOc0h0Fro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198725; c=relaxed/simple;
	bh=ESEvRJfzS3KGanZGJdEyvowcxkbIO8/vhCUM5ogIqKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HDgfxVoVFM7bI6bPFrkgD7nOa4/FImKxFWl+tGILn5rGyA6WCARp7HqvkrJ4nkqSYBC4P01qE3MJM+3uVlhDEMf54SoQUiSrwZeD2u+KhLk6oFk/gfKc5oYLEvngUCDGD7LduDF4B4LIX2m6SORD9hIr/gp5y4N0C3qOy2zvWck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru; spf=pass smtp.mailfrom=t-argos.ru; dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b=tmBswakr; arc=none smtp.client-ip=109.73.34.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-argos.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t-argos.ru header.i=@t-argos.ru header.b="tmBswakr"
Received: from mx1.t-argos.ru (localhost [127.0.0.1])
	by mx1.t-argos.ru (Postfix) with ESMTP id 3B28E100002;
	Wed, 12 Jun 2024 16:25:04 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-argos.ru; s=mail;
	t=1718198704; bh=YI6fT9fSUfrIGUkPmAXo1xXDMM+gKSv9iSq1TDWxF58=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=tmBswakrhxB2kfkUeVRGuu1R5eukICc6sfSxxCi3fBAs4hcpPrB+xrHluspBK3Ubk
	 Sfg/TczyNUed6vXa95EhJgAGFTQ9+d8wyiOI+5a0ZX0Acu9a8Vyv7Et/VbOcYEj7AA
	 1LEusbbzkDtwvMjD5AgBxCx+2cS5/SNubK7JoM/bjLLaCdHplD9/49sdkvaXMcs5Lf
	 RGO8BSimN8sCMIDpdmNK1cOPQ56WvuRn/ixIzgHhFPAA/Auo8RB2czUuYE+ddYDNS4
	 Cq50idQmyv2uKX/MEtqJxdiwfzO7pUs+FBwxhH+GvcikwiiD7DL7Ph3nql/aWZOONU
	 6X7m6b2VWH79w==
Received: from mx1.t-argos.ru.ru (ta-mail-02.ta.t-argos.ru [172.17.13.212])
	by mx1.t-argos.ru (Postfix) with ESMTP;
	Wed, 12 Jun 2024 16:23:45 +0300 (MSK)
Received: from [172.17.214.6] (172.17.214.6) by ta-mail-02 (172.17.13.212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 16:23:25 +0300
Message-ID: <3176acd2-0b0e-4896-b189-60c05ccde593@t-argos.ru>
Date: Wed, 12 Jun 2024 16:20:12 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lvc-project] [PATCH] remoteproc: imx_rproc: Adjust phandle
 parsing issue while remapping optional addresses in imx_rproc_addr_init()
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Fedor Pchelkin
	<pchelkin@ispras.ru>
CC: <imx@lists.linux.dev>, <lvc-project@linuxtesting.org>, Shawn Guo
	<shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Oleksij
 Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, <linux-arm-kernel@lists.infradead.org>, Peng Fan
	<peng.fan@nxp.com>
References: <20240606075204.12354-1-amishin@t-argos.ru>
 <ZmcuFRfjKRQG9OXI@p14s>
 <20240610-4fb504648421659114538a50-pchelkin@ispras.ru>
 <Zmh/J0hvTT1Jwvjc@p14s>
Content-Language: ru
From: Aleksandr Mishin <amishin@t-argos.ru>
In-Reply-To: <Zmh/J0hvTT1Jwvjc@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ta-mail-02.ta.t-argos.ru (172.17.13.212) To ta-mail-02
 (172.17.13.212)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185880 [Jun 12 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: amishin@t-argos.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lore.kernel.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;t-argos.ru:7.1.1;mx1.t-argos.ru.ru:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/12 12:51:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2024/06/12 04:43:00 #25560246
X-KSMG-AntiVirus-Status: Clean, skipped



On 11.06.2024 19:45, Mathieu Poirier wrote:
> On Mon, Jun 10, 2024 at 08:36:19PM +0300, Fedor Pchelkin wrote:
>> On Mon, 10. Jun 10:47, Mathieu Poirier wrote:
>>> On Thu, Jun 06, 2024 at 10:52:04AM +0300, Aleksandr Mishin wrote:
>>>> In imx_rproc_addr_init() "nph = of_count_phandle_with_args()" just counts
>>>> number of phandles. But phandles may be empty. So of_parse_phandle() in
>>>> the parsing loop (0 < a < nph) may return NULL which is later dereferenced.
>>>> Adjust this issue by adding NULL-return check.
>>>>
>>>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>>>
>>>> Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale imx_rproc driver")
>>>> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
>>>> ---
>>>>   drivers/remoteproc/imx_rproc.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
>>>> index 5a3fb902acc9..39eacd90af14 100644
>>>> --- a/drivers/remoteproc/imx_rproc.c
>>>> +++ b/drivers/remoteproc/imx_rproc.c
>>>> @@ -726,6 +726,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>>>>   		struct resource res;
>>>>   
>>>>   		node = of_parse_phandle(np, "memory-region", a);
>>>> +		if (!node)
>>>
>>> You're missing an "of_node_put()" before continuing.
>>>
>>
>> The node is NULL in this case so of_node_put() is not needed..?
> 
> Oh yeah, doing a of_node_put() with a NULL value is are really good idea...
> 
> I will pickup this patch.
> 
>>
>> Btw, there is a "rsc-table" node->name check in the the end of the loop
>> body. It was added recently with commit 5e4c1243071d ("remoteproc:
>> imx_rproc: support remote cores booted before Linux Kernel"). Seems to me
>> it forgot that of_node_put() is called way before that.
>>
> 
> I agree.
> 
>> Also commit 61afafe8b938 ("remoteproc: imx_rproc: Fix refcount leak in
>> imx_rproc_addr_init") was dealing with the last of_node_put() call here
>> but it's still not in the right place I'd say.
>>
> 
> You mean becaue of node->name being used after the last of_node_put() or is
> there something else?
> 
> Aleksandr - Can you send another patch for the above?

Patch is sent.
https://lore.kernel.org/all/20240612131714.12907-1-amishin@t-argos.ru/

> 
> Thanks,
> Mathieu
> 
>>>> +			continue;
>>>>   		/* Not map vdevbuffer, vdevring region */
>>>>   		if (!strncmp(node->name, "vdev", strlen("vdev"))) {
>>>>   			of_node_put(node);
>>>> -- 
>>>> 2.30.2
>>>>
>>>>

-- 
Kind regards
Aleksandr
