Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD57F26FD86
	for <linux-remoteproc@vger.kernel.org>; Tue,  1 Jul 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751364732; cv=none; b=bDoN4KL6VgKtyAEk5oUVLbW/nQde4wsGwDdsIzl6PYUE5HdpOV9yqSeIcvHuBFIM1R6cy9gyky/aS6iI3MTJ/aEEgevku8xfpMrEdudX3gFBoP1fwe5K2aqqgDGCl2a2jrlXcP1Z1rCjJ508+xv4FbPUyqcS37PAtCPoT3V/doQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751364732; c=relaxed/simple;
	bh=i677gT0Lf3VOXIYNP0ybjGzvserOJM9ohhVxqFpKZ6E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=SzSJjRw8RU1gL8KMoXh0+FZ8lVHvZhVEJxPImFXqFsukRAGAeqfekaEm3A9nWD8I9AEOQzZl196VhRTULUIVB7jalxQ5zV8KnkK8bqbr5mzhYbIv0VkfaHWl/3cYLT6sfmwhx86sHr7sraymk1E7wtOenuG+OwLutarvWBVWsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=w9r/QnrV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="w9r/QnrV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae223591067so536364066b.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 01 Jul 2025 03:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751364729; x=1751969529; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjxelGecQDmUYdn9tTQMoWPi1qncMiGAW8E3PTy6vq0=;
        b=w9r/QnrVmsbsmnnURN3/QeO5+tn0+XiaG1bYujOBcgAqQYRp9eACKe175ZWAjxqUwh
         YeDGANvUir+nNPvLiHyYF46AUqUSA82w9t6q4HEN9Wx2gvzKRGKtT8d2nooAKkem8bCY
         RjImig16k3/KyAWbM1gtV7P6jq2CzIbM38XIhX3WPraSTakCboYXrwUwV5xKmkHysrQY
         FOgWipuxmD5d3zfBhb6LtAkpq4znR6mjTLTqizTLTKIFGQqzWhCWzHt0KbjfFqskQvc3
         pN7IAcg1kR8lYVZYdy3WUmfOstIsNA504sIFEN+gPfSB2C+rQWGSxy32txBpNMnJeCL1
         1YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364729; x=1751969529;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjxelGecQDmUYdn9tTQMoWPi1qncMiGAW8E3PTy6vq0=;
        b=H9OUiXIbv2V+xGKRqGqPbURQafxgahsJuoc23O/+wHkHciU8Il9ImRxNHsKGHJiB+4
         dMYeunxtq89+0wwZBvbOknmlET4GiOTyFL/Zp3vApogoLi/6A4EGPZSgPFwZ8d1z0ot6
         1ljRdAmhKShS+m00bf6VOfCIVZUW9Vgt5RXN/MzuXF01EJNMHUfKiuxB74aEiH4r2xjr
         EgPugtu3R+4ota9FJIatAUt8J+zEAF0teAs6y0eiF+z4VB4mBVW0xLjy+Ln/ctX4U5Q/
         xdNDaYDGPPck585OiUSG4Z9ECgqLsbd7Ct8SGvwLmBgZAvJP+52XmzU9ZlqLB3yWJsDL
         4XmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuXE/WVlCBMN1LM7dOnFntCXeAkzYC3uIujFoA+xXvo3uUe8RiZScRyhWQa05insN1/wvu5wkSQxgcsnIwwskp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2WIeERCq8GKR+v/LlItn4ka3h8B4gXskeEc56cCZ2e7GGCN4L
	qNW/tPE9/X/iRglmVijZ4MAx2YGxDCxMcLocdC8kEOAGc2fBne82EzWKMUvIZEpe8Fs=
X-Gm-Gg: ASbGnctKay6dEKGfnT3wttQLelfFG6iBXbH7sZ//iTyLUNJPRvaDFP6v7fks3/SHQdl
	TbGrPMxrRnsxXxUAV2iJGblbiexskfUA5crBNiutO/q9kptqT/NBn/LKbq+UQUqZxViedtaJNe1
	HLT9QuLqyJdX8ZH1W0UpEnMLC1X3bbPzbfwSZ7Rj6nHpnTxvAVloRnwJpSvEXhordf64/oCAzRa
	2FEdY2yBhSmXBLba4bJTIR4Sj7MrVQAHDzFZ4l0heRO7bKuJJpekuNOo0QczEUzKnO3NzpPpivC
	EdTO1DxCYP3ERUIU1+Vf7QfsDTARrPxbiZ5QM4cvSu2fE15XpKMSacz5OUJ432U3O9Ao6sU9KIS
	gqyCFl5j74CDmRn48DaU1vtxeHvB3PLzXBK93vCQ7Zgn+I01b4bAAu1QIbmAwQA2p/MGNaCE=
X-Google-Smtp-Source: AGHT+IGcTClS0HlsuLDMWhbFrqidSZrUXl02eHSOq8Iap1JzeM2KzxLgijD6DBQiU8k1adtKZOCVWA==
X-Received: by 2002:a17:906:c10d:b0:ae3:63b2:dfb4 with SMTP id a640c23a62f3a-ae363b2e17emr1568424866b.27.1751364728984;
        Tue, 01 Jul 2025 03:12:08 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659e12sm832466866b.40.2025.07.01.03.12.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jul 2025 12:12:07 +0200
Message-Id: <DB0MZCUM41RA.7Z6461I531VD@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Mathieu Poirier"
 <mathieu.poirier@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom,sm8350-pas:
 document SM7635 MPSS & WPSS
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250627-sm7635-remoteprocs-v2-0-0fa518f8bf6d@fairphone.com>
 <20250627-sm7635-remoteprocs-v2-1-0fa518f8bf6d@fairphone.com>
 <20250701-melodic-courageous-mussel-0bed22@krzk-bin>
In-Reply-To: <20250701-melodic-courageous-mussel-0bed22@krzk-bin>

Hi Krzysztof,

On Tue Jul 1, 2025 at 10:12 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 08:55:42AM +0200, Luca Weiss wrote:
>> @@ -91,6 +93,7 @@ allOf:
>>        properties:
>>          compatible:
>>            enum:
>> +            - qcom,sm7635-mpss-pas
>>              - qcom,sm8350-mpss-pas
>>              - qcom,sm8450-mpss-pas
>>      then:
>> @@ -142,6 +145,22 @@ allOf:
>>              - const: cx
>>              - const: mxc
>> =20
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,sm7635-wpss-pas
>
> Everything fits better sm6350 and no need for new if:then: entry, at
> least it looks like.

True, that seems to work fine as well. I can add it to the
qcom,sm6350-pas.yaml bindings instead of sm8350 in the next version.

To be honest, I don't quite understand what the concept behind the
different PAS bindings are, when an SoC should get a new .yaml file, and
when to add to an existing one.

Regards
Luca

>
> Best regards,
> Krzysztof

