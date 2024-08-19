Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3969512B176;
	Mon, 19 Aug 2024 15:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082869; cv=none; b=ggLSgDNHTseq+/cQpoSr0n2m5vGBtiXrF2Xil5Ov/2nPPCnKXNTztmHTRiS1JtKlKFZtr+j1aa/5FL+kd4wZTHrBg6DaBLPWOGAYqF5NMbwqcpCDSv/hMVkV37gDdArA1SctFxjDPJLTkW8IVGt4QaMpPMaAERFQ9gNDikmFKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082869; c=relaxed/simple;
	bh=HS+GBwWvBK/+vgNF7OWoTTnd7v0GySP6wMtirTG29JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q8LbieaoGwk5/v1nm1Mx62AS4SeDGt9X3LMb0M6VMKsAh15HcpeTxRy4JZKM8tl//ryLmk8UF9CuObVm2BQJSgo6nw6aK3LC6BKN6N9UfYkCeMiH3WwXXO0PWsXmTBBLwlUcI/bR/WrsC1x3eIPFVjtW8rLJcwqmI4HzMDTXx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C4W+Jqrw; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C4W+Jqrw"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47JFsCBj073351;
	Mon, 19 Aug 2024 10:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724082852;
	bh=ozAOveEx1TyVnZowYy63iIx8ITlS152xJXt0YCwvoVA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=C4W+JqrwJulz9V3MRKLCnuumiCAWWKkJqtJ7jacjOznGzcVZ0+dfcegLBU7lXCADW
	 XTnoMlLpLmwbh2CJM/Nq9x4u6wSp4AKA7SsqJeNYmJYj+awO7mpL72O7Dn4e8q9M1x
	 XnVWcXlWtTdr/Bj3xfr5jzfWznYnwz612ZP0rgTU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47JFsC7D027482
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2024 10:54:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Aug 2024 10:54:12 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Aug 2024 10:54:12 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47JFsBZ3089334;
	Mon, 19 Aug 2024 10:54:11 -0500
Message-ID: <98d65c2e-f5a2-4894-b76d-6fa0fb8b6daf@ti.com>
Date: Mon, 19 Aug 2024 10:54:11 -0500
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/9] remoteproc: k3-m4: Add a remoteproc driver for
 M4F subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
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
 <Zr9j5HBjRqqRIoaD@p14s> <e5140426-7e69-41b0-858f-16f83eed871a@ti.com>
 <ZsNlic5EbQP2BdFB@p14s> <f529c5ef-f61c-4c8b-a589-652aca162f07@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <f529c5ef-f61c-4c8b-a589-652aca162f07@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 8/19/24 10:39 AM, Krzysztof Kozlowski wrote:
> On 19/08/2024 17:32, Mathieu Poirier wrote:
> 
>>>>> Please remove.
>>>> Forget this comment since it would cause an error in __rproc_detach().
>>>>
>>>>> Other than the above I'm good with this driver.  That said I can't move forward
>>>>> without a nod from the DT crew.  I also noticed a fair amount of code
>>>>> duplication with the k3_r5 and k3_dsp drivers.  Dealing with that should not be
>>>>> part of the current work but will need to be done before another k3 driver can
>>>>> be merged.
>>>>>
>>>
>>>> The above still apply though.
>>>
>>> Me or Nishanth will pick up the SoC DT patches via TI SoC tree, once the
>>> driver patches are merged. Feel free to ignore those but queue
>>> dt-bindings (already has DT maintainers ack) and driver patches via
>>> rproc tree.
>>>
>>
>> Can you provide a link where the DT maintainers have acknowledged the bindings?
> 
> The reviewed-by tag serves as acknowledgment as well and the binding
> patch has it. Conor gave it on some earlier version of the patchset. I
> did not check if there were any significant changes in the meantime, though.
> 

Was reviewed in v8:
https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240424190612.17349-2-afd@ti.com/#3302840

If there was any significant changes since I would have dropped the tag.

Andrew

> 
> Best regards,
> Krzysztof
> 
