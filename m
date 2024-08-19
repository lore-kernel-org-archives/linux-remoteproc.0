Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADF4C125;
	Mon, 19 Aug 2024 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056371; cv=none; b=ctR6ADsq7PRn7v6QmceGQzY33LiTAoBDW9tiUQkUNsnJlW5DlQotHIk83/eczGRnWb3YYsbfSgYuWsdmFkYpAPqN32Ox1pbGbra59kQiZPgnqj5xkMkrxzEtlQew3MO7xp7oDIFXrHulbLYJfKN6iKztURHbxUyTkp/MLYsKyPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056371; c=relaxed/simple;
	bh=ZIYg7RLH1+uZnk0IZRJZ10c2hHQsYwb+IZKGRmNbBi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oBzCaWGaT7i1D27pmLN2uT2KuiXAdjgyboP24Lm5uwB73lCc4jDx8FcAbVI6q+AiejY/g3efacs1EvEvP9FtOpSMvS+nl/jefSytI0rBXxP15ucTLk6HgUlB3ks9EppRHyU3+nF87FEN2M4OukF+ew1gei0uZfWoD6+64oLmBks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Qheoh0jr; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Qheoh0jr"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47J8WbTS085474;
	Mon, 19 Aug 2024 03:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724056357;
	bh=7iEMJxVgqEWFaX/As9NKzd3hIp1ICaM4bk9aNoBrD80=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qheoh0jrH1RmQ5TvN9yRyarDXGOlMZrkvrDZyA09M/Pf9X1MbiIKWrSIwioRbHNfb
	 gFT/rr5WPiLwiBtvsWiNjd1QagmjtQ8I0e8HHmns1L/ofKTgtRZnBI3I7Gu+BeVQCg
	 KSW0Go6u3MjfAHK7yl10XpdJpGivPIVTja/d7qGs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47J8WbVa039098
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2024 03:32:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 03:32:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Aug 2024 03:32:36 -0500
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47J8WWjI119145;
	Mon, 19 Aug 2024 03:32:32 -0500
Message-ID: <e5140426-7e69-41b0-858f-16f83eed871a@ti.com>
Date: Mon, 19 Aug 2024 14:02:31 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/9] remoteproc: k3-m4: Add a remoteproc driver for
 M4F subsystem
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>
CC: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Hari Nagalla <hnagalla@ti.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20240802152109.137243-1-afd@ti.com>
 <20240802152109.137243-4-afd@ti.com> <Zr4w8Vj0mVo5sBsJ@p14s>
 <Zr9j5HBjRqqRIoaD@p14s>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <Zr9j5HBjRqqRIoaD@p14s>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

[...]

Hi Mathieu

On 16/08/24 20:06, Mathieu Poirier wrote:
>>> +/*
>>> + * Attach to a running M4 remote processor (IPC-only mode)
>>> + *
>>> + * The remote processor is already booted, so there is no need to issue any
>>> + * TI-SCI commands to boot the M4 core. This callback is used only in IPC-only
>>> + * mode.
>>> + */
>>> +static int k3_m4_rproc_attach(struct rproc *rproc)
>>> +{
>>> +	struct k3_m4_rproc *kproc = rproc->priv;
>>> +	int ret;
>>> +
>>> +	ret = k3_m4_rproc_ping_mbox(kproc);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +/*
>>> + * Detach from a running M4 remote processor (IPC-only mode)
>>> + *
>>> + * This rproc detach callback performs the opposite operation to attach
>>> + * callback, the M4 core is not stopped and will be left to continue to
>>> + * run its booted firmware. This callback is invoked only in IPC-only mode.
>>> + */
>>> +static int k3_m4_rproc_detach(struct rproc *rproc)
>>> +{
>>> +	return 0;
>>> +}
>> Please remove.
> Forget this comment since it would cause an error in __rproc_detach().  
> 
>> Other than the above I'm good with this driver.  That said I can't move forward
>> without a nod from the DT crew.  I also noticed a fair amount of code
>> duplication with the k3_r5 and k3_dsp drivers.  Dealing with that should not be
>> part of the current work but will need to be done before another k3 driver can
>> be merged.
>>

> The above still apply though.

Me or Nishanth will pick up the SoC DT patches via TI SoC tree, once the
driver patches are merged. Feel free to ignore those but queue
dt-bindings (already has DT maintainers ack) and driver patches via
rproc tree.


-- 
Regards
Vignesh
