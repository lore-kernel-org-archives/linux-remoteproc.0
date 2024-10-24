Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD15F148838;
	Thu, 24 Oct 2024 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729766881; cv=none; b=DDHtjP0gStRlks7Q8HeaZdz6+Ao/cJl1zsDaHiGr7KCBFcZHj4nwTilvOG/Jkq/nxjiOFcZzeAMk3jjdso5zsTPcVWzuEuO0/eZchaoFGnH6sROy2C0wke7VPeyimQivoD5tZsx8pkKnusPP9DAxuXYwVSOb1Nd9GaKY67rjyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729766881; c=relaxed/simple;
	bh=Fa4ZeugCZulqq3yRjA8uOwaDIqdku/njHsQsYlodq+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIFCFiqcUY+gejHeH0EZcEgzIGpUF8b8TK5HWYhHrWYaFWUAIIAuGHGFD9+gCDQS/6TVWrRwFmEmCpj8ES6UzLyKKOmeW/A5hcxS/MKHLMa0YLNO/K5KpUjRasJYUJmU2DlZDT1S1VM+mNggeMuuqSXsRaCvJAz/SJxNjfaagqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ6sZHMB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ6sZHMB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so1259087e87.2;
        Thu, 24 Oct 2024 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766877; x=1730371677; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=fJ6sZHMB0hd0b1ivbcbhhiELok3748GNQx+bu5c4hc8ru0gms2Z2cLtrZFgrNfIaPz
         DRpxWa/0iuoAJ15slMkSthHIt0kLBNAB73gAC0WXxFjfEx6hL5eHJ+RmgoAEyJoRa8iD
         m2X9YctZbn4SoGdRyFMmKbQfHumZ3Oq2GHBcZ3zLG0oFYtSeyd8Ba9ZWbIW4ouKxPMN3
         cE8tarKNZZneM+zb2yVzCDBcX39eHz+He+lZLdKKR5mw1TzL3QuSnMDCZEJ85vYNyfjX
         hirbiyb4U9nxXX3Xir7GHXUKK6kuLlxKzF4H80cbzU9tGiULf+EXhVDBuQZpaBnYCFLr
         z3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766877; x=1730371677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3DKzoGRNNveCs6SOsESX4/t1nglUdmun8SVRIZGpys=;
        b=lQVe6SmYdzl4IiqjCoz9gl6EgFIYXVCyr5XXwMy9nuS2ZbbB+8gCK/BbgV3OZ7cvJL
         7Z3xE4K4HZUHj2NWzf6/CTzLqqD6BG6/jQhh5LFpI9EpDuRju1HEg4zsdNFMtuJrvh38
         TtY7pFmKqB6WvaellZQZrSCIyjsyvba0xHjhSiJihDxjEnSnk73MAybvROVdcWl4/LVI
         fwF5lV5ZVErp6f7wra856xhTqJ/T1LJSkgoYOtEU9Dvyl4eJ+K0NP5A6tph+UVbfWSd5
         5uGDdMzjxUjeiV6z6IwL6FJTLqokBOyyxyYrU7Ttzs4kOCrtksrZs/Q/yZRdQWPFg7vs
         fSlA==
X-Forwarded-Encrypted: i=1; AJvYcCWYIzOq2/hav5roURogGXsugD1Gj7TnvQvme1zqi3arFCH1iJieMwI2HkIoVQXgf4Me1lBMVHxiroYYTzY=@vger.kernel.org, AJvYcCWhRvj6yn+SXxots1gLQMyHhN2z5MiOjC8i5Mt6ivTv1y6+3JI1UITA8N6rpICzoGTfoZezECa3Wa/KCThA@vger.kernel.org, AJvYcCWwi6DHtKfpxLg7T74J5hxhwqIo2hleOjEj4lBJAp3osKm6cbRtaqsdqH1jJNsq8s6G04g5LZ3oKWCi@vger.kernel.org, AJvYcCX5Z2cARk45Y8EjtM8pAqX1pKpu26RqznfcgnU5XH7RY1S64FZOqYIjF1nqkvNMakP2p3sNeVb9gVSiNkrHBRC/Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIguarCUq0QvhBcn25SmvVUqYnncaMdw4Dm0nJ5qIXbMDu1Puu
	8yJ/0haXm9aqBjNEkfzth+Jrdb8WGZdHsoWpowIZhiwpoT8mW1Zc
X-Google-Smtp-Source: AGHT+IHHCGUunbU1WBMJq+sAZx9YzaIXr41UGHDPNjS2vbTVWpJJQid4DmPQCcWS5iyhHtNJjwXglg==
X-Received: by 2002:a05:6512:4489:b0:53b:1f59:dc59 with SMTP id 2adb3069b0e04-53b1f59de4cmr4200149e87.6.1729766876589;
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Received: from [192.168.4.167] ([92.120.5.12])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91306fc0sm600659666b.91.2024.10.24.03.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 03:47:56 -0700 (PDT)
Message-ID: <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
Date: Thu, 24 Oct 2024 13:47:53 +0300
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
 <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/2024 10:45 AM, Krzysztof Kozlowski wrote:
> On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add new compatible for imx95's CM7 with SOF.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>>  1 file changed, 53 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> index 57d75acb0b5e..ab0d8e017965 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
>> @@ -28,6 +28,15 @@ properties:
>>        - fsl,imx8qxp-cm4
>>        - fsl,imx8ulp-cm33
>>        - fsl,imx93-cm33
>> +      - fsl,imx95-cm7-sof
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dram
>> +      - const: mailbox
> That's quite different programming model. Are you sure these are devices
> from similar class/type?
Yep, these are all Cortex-M cores. It's just that their usage differs quite a lot.
>
> Your big if:then: block suggests this could be separate binding.
Ideally I would have wanted to place the compatible inside dsp/fsl,dsp.yaml as the
programming model would have been more similar.

Unfortunately, these are different physical devices (HiFi DSP core vs CM core) even
though they're all used for DSP purposes so I'm not sure this is entirely appropriate.

Alternatively, if you think grouping these devices (i.e: those represented by the -dsp compatibles
from fsl,dsp and the one represented by the compatible introduced here) under the same binding
is alright we can just branch off from fsl,dsp and fsl,imx-rproc and create a new binding for
these devices. I'm expecting this to be relatively clean as they have the same programming
model.

Let me know your thoughts on this.
>
> Best regards,
> Krzysztof
>

