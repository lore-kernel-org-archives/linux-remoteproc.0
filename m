Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D842123A
	for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533965; cv=none; b=UyGhtedPk+CxnwMavyIeVPd7z4W5VnCnYUx4yXD16Gga3Imkb+yKM49yXSrOtU0UTS9rP5UaThATYQWZxF0MhaESHGwa6fVjJmuJ1thd1XiMUgQfQlwsuDJNoSG2V7tpgkyhDGenGF3Q76IUTqKtDR/iFIcMZAoOdmQsAVj+/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533965; c=relaxed/simple;
	bh=WoKWEWKlv1+PeyUN1OlqnAXZmrjz3ThOQrXHDS8EOWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkAnkfvVupiZn0iZnzD/JqbkL7DPYSF2xO7tEy4A+Kxxsr+jhC8IspuIYCRZVDXmxHp3dcFje+QkJcs1sA1UznlmcePSLv5DDbyDcHSlD6Ob4b9Ha3KHEcrM3alAUKMirtEkIuLNiqQvo4VBFVwTSDJ1UpQRmaHzKiXKDawDwJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DorRFm4I; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DorRFm4I"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49557167508so6027665e9.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 12 Aug 2026 04:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533959; x=1787138759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=DorRFm4IacUf7NsIeB+lrEAcJTZCW8NS68j7RoSsCM+dm++yg/TNKNJU2lnRaTF711
         X6DzbaC3iPlgJ95PMEZy4ecxi6gGDiSXVraQEpzdGSaFlFw7sYPy72WtA+Nyx+68aRs9
         vyJ+uajT/aUamQxTJmuE2FovJxcJ6xXTp/9u9BLYq3O1Zbzlgs+4u4BuLe4B5cmdiG6y
         BPHq3ietiA43cZsy6W2IKro0j55/ux32bRYIHWAYppXasyaQ5dqetvIN59W9V4uLpwtr
         rmSWqIMzHH/ULUuZ4LG3O7e/d9L2W7KHyTr+fY3aQ8xn4chZRKfpa4d9/2e01P1Ru09u
         Z6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533959; x=1787138759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ey4E5gbb1zGfpxU9QFub0aU8JCEKCtqwD4Rbc0BSyts=;
        b=CUEkOmnvFXnQ/0A3T/hCsg/o+MlSI8tyIN/KsiljyvasbwCoXDvXntfQdapwSLJMB7
         I9U5J3z8v8YFrbv17CSiC9IJwL4NrLr4+Fvu56FezlGgobP0zi7RLnm2HnHD8R71xSMn
         cZllTFub03CohEhvqhL+yBOE40CCp+GcCKj1i3d+ruDZ5D7sbbRWlq9sh10AbGlyesJf
         w+uVcA5j7rdCoSm//GuDLABHoMR8UcKEWNOc2cJh3R6iPoww7QgodAqbVkmJgU80Ntd/
         ZjNGSuTFZczN3qGiNSEgs8dgzVDNSrxhJyTDtQ1/SPdfw4OZ84WkUQVJxaikjkbd0SO2
         S22A==
X-Forwarded-Encrypted: i=1; AHgh+RrrlQOs08DcQUk9OY+X+tV5TsK4SVkeRjJ+K3yo53xLyZU4e04WjagmoWax4mp6fS1czTsom6z1B9M+MMErTuUo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq74u0olSTEzVRca4FUMDmRxs4lyujgdtXEEjr//18jStWT6xM
	CINWPiTldhLDCty09FZiT25I2cn7BGhs50sYDJ6i387QQKPrzYOTihqN
X-Gm-Gg: AR+sD11o7JBuNDEKZdynzV/14KozffPhpaTmTNPvQ3xJ841bMxLiNcbl7Q78t8ZkXcM
	J0RSn1AtbRCa/i7zMMdZGhAq0wTMSMK465IODDrP1qK3NYues7pu7/49PNFla++0YIXVG1udU90
	6ogD2q2cmlmYBgNjtQ4PeNOenc1ZUDAxCqE/RrAmdKXfkNmaUmkRk+hMvaFEpxjxUYsIZaOCLrO
	tvrH2Diii5bANJtk+wliow/wWvilvsSezv0xNSyISkBLGTnqZPCGZCEW3lZSnRillt6LGG5Lv1/
	TSYPcIbidXMO6qL074ZHJNEbp2piQYsfhNVcHUhQXvfKcafMvFeCgEogqOMZEQoeUGyDz25Dgxm
	idLwP4ykbG6P7L82cVOJPf5Fyj5RAjjfzvPJcxiw9nOaFJQ63SLWya5khaZ5gfs1JQOYRV9mjlf
	s8rc4Oe1QYNyONUGJATvHhEZyprST4/hTchWRpGRVcSUKxihC/3aMyzrRXISnkF/zQjvGaTiyKe
	J0sXL1SZ6e5ZpJxi8IGQw==
X-Received: by 2002:a05:600c:4f87:b0:499:48be:3189 with SMTP id 5b1f17b1804b1-4997bf81217mr46280755e9.0.1786533958498;
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Received: from [10.25.219.170] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b238a9asm42581695e9.3.2026.08.12.04.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:25:58 -0700 (PDT)
Message-ID: <36260069-cd81-4744-b5fb-8467f7874851@gmail.com>
Date: Wed, 12 Aug 2026 04:25:56 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 "Frank Li (OSS)" <frank.li@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
 <amuUbkDM60eFzvJo@lizhi-Precision-Tower-5810>
 <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <MRWPR04MB123301AA9F074FA2976AC36C288D52@MRWPR04MB12330.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/3/2026 2:03 AM, Peng Fan (OSS) wrote:
>> Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc:
>> document optional "memory-region-names"
>>
>> On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The carveout region names are derived based on the DT node names.
>>> Because of this, the DT node names are ABI, which is not supposed to
>> happen.
>>>
>>> Fix this by documenting an additional, optional property:
>>> "memory-region-names". This way, the software will have a way to
>> build
>>> the carveout region names without relying on the DT node names.
>>
>> "After update all existing DT tree, this will be required.
>>
>>>
>>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>> ---
>>
>> Additional information to help understand why it is important.
>>
>> 1. at thread wrong use vdevbuffer insteand vdev0buffer as node name
>> https://lore.kernel.org/imx/20260705202439.3F5771F000E9@smtp.k
>> ernel.org/
>> 2. similar case happen at
>> https://lore.kernel.org/imx/20260715071741.79CA81F000E9@smtp.k
>> ernel.org/
>>
>> Suppose these problem should be detected by dt binding check instead
>> of sashkio ai.
>>
>>
>>>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> index c18f71b64889..8e3e6676a95e 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-
>> rproc.yaml
>>> @@ -62,6 +62,10 @@ properties:
>>>      minItems: 1
>>>      maxItems: 32
>>>
>>> +  memory-region-names:
>>> +    minItems: 1
>>> +    maxItems: 32
>>> +
>>
>> Need restrict names
>>
>>   memory-region-names:
>>     description:
>>       Names for the memory-region phandles. Each entry must be one of
>> the
>>       following recognized names. "vdev0buffer" is the shared buffer for
>>       virtio device 0, handled automatically by the rproc virtio framework.
>>       "vdev<n>ring<n>" (e.g. "vdev0vring0", "vdev0vring1") are the virtio
>>       vring buffers for device N, also managed by the virtio framework.
>>       "rsc-table" is the resource table region used to share the resource
>>       table between Linux and the remote processor when it is pre-
>> loaded in
>>       memory. All other entries are treated as generic carveout regions
>> that
>>       are mapped and made available to the remote processor.
>>     minItems: 1
>>     maxItems: 32
>>     items:
>>       anyOf:
>>         - const: rsc-table
>>         - pattern: "^vdev[0-9]+buffer$"
>>         - pattern: "^vdev[0-9]+vring[0-9]+$"
> 
> There might be other entries such as m4_reserved or m7_reserved

Then how about an additional pattern? Something like:

- pattern: "^remote-reserved[0-9]$"

I believe a board could, in theory, have more of these additional carveouts, depending on
the range of firmware provided by the vendor's BSP (or the community) for that particular board.

Still need to put this in code and test it, though.

Peng Fan, Frank Li, would this work for the NXP platforms?

Franceso, could you please let me know if this'll work for the Toradex platforms?
