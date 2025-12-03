Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233F430101C
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 18:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764788219; cv=none; b=AuAqiHbyJaLecyHzC+zSYZE06oKQR5NZWUJ8LSrFUUr39BYwndnuD9wshGmOTOfhkDl6FQ8bqe4F6jzzGg4OeEUlYI1WRash/Bv89tA3qGPeY0B4HjsGJlGnd/pJbjbUM9kNQbrMdsWkKb3o37dxRpKxfR9mQrvMdGi2VR+QIRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764788219; c=relaxed/simple;
	bh=451eezjKzgyOtVuH33TiHjo9Apd1b2ad46/RYOa3TK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CT3pDtnMKSxVACgXlgwnYwGLmHuVrPHbBlN5Z5RV5RRNUKlIly3jxebhxvkNaDXpoVqIfuUKWl6bZ1PTjASjs32lr+SqOD+yIaVsohLQtnLlzQ1gCtTo/1F34u3X39ggVKIxclgGverTZF0o8OlWCC9jRdu/b5bzJBTTOdxmvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYeFjZlS; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYeFjZlS"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so56875b3a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 10:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764788217; x=1765393017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=71E/ilkLBTqKwG0Dx6ylFmlxqv3BqJ7EmKi1/R6JSno=;
        b=hYeFjZlSEhLpTl4tmq3AJznXp3ToWUH1OG0LTriGJc3T529t2159MfDArLErQWIMjJ
         rj26DWpcg3ILZluKsD8a83nG9PO5AOANe1ZRUro8aJ9yE0/27Z5XGeWXTfm3nRE9xBkL
         sRvwstoO17vAYSwMpHKnCGp506/oPEqHJRkEW8BWnZagyPscLDIFXsrOir+q5DyJrgE8
         WEljobbOjpWwqQtL6rsdUkaIPmjqcnc1Z6O6GaW3WUFwIR/qxz214LeMWcaaHoQUB1FG
         6909tPCHLaKDht/bNCFkwxSefCH+P6RRoeqqps934xQ+4p8SbSDO37tYQULAD84leVLF
         2Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764788217; x=1765393017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71E/ilkLBTqKwG0Dx6ylFmlxqv3BqJ7EmKi1/R6JSno=;
        b=ZawNo9K3nL65dQ6tyB1PmGVu7d/O/XX8VAVZk4GGo5fnNdl3kh1fvw56aEl+V9a6Jo
         icy9EcZs89+fB+Lp3wCxmkkjcrSgodNz6NreaJ1V9TJgN39ITs/wqhEWfwg/UVo1GueI
         7Ba9FoJDJg7OlOys21ehmr69xwSmWSzE6m1D+KsvJRwRq4GcTuC5HTWe29mAgmHHaNEv
         SmZ8mQoemvQc6cLlUXjsk/PzWcr2GHqf1pSy38v/okE8jVz9M1bjhmCCvDsylgaXJgim
         GTF9ol8UvOgddhlPrYeprL9a0R/wCgqIPmdWE+isoM7sC8dTf+yByruM1/4bZSzuViRg
         P7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXSAxcO/CfHpjJ30t9Wg1OvuBN9l4NwFh3gLnvNa9HbGf2Pf5QBrnyzri+MX6H9I85vSpAErCrlBYqwBvX9hZpx@vger.kernel.org
X-Gm-Message-State: AOJu0YzF3TGysvvnfYPjKAXVL3S9t6qU323oXIXCai3SwSOAMDJrYl8l
	7foGN20tgOUHq4e+SE9CcgMo4Ihl5sbHzs3219F0tq3L9KVVROvyf7XR
X-Gm-Gg: ASbGnct0O1E5FYUCngOeuDb7Ygnv8YR85eDG+49Cn8sCLqOU7iUZeQBJcRSI5uDX4/V
	SUh+Ylc/y4WegIL2TzOaugDfYkiPv8P+77O8k7cEKh//Yz4hbdJDGgqFsWlrifmJZPTWKzCdwAd
	OphpF/hD4776Kx/CsSPh3OdoqjPI3EW3rzOjScalQrSzNjGzTXoHw3Tjhb6/i84hS1JSqPOpn1W
	C0/TnB1kc2hiyiQ0d/OUkWkJk7pEtTTd4smmgqWH2PCV8+363gTHrqQdvo4NhfTjteR275JmWjl
	4ABQFvM6Xm9YEkwd7v+GWVML0rEN6+TBhlxG0upMFYMDSyhujnR654lqvuc7mzE9oSvtzvLkrKZ
	nwhK47IQzWiNjcg8b67w0cx5JQtkpVu09j8RojNHwlCe2sWsxR1aLZHaGT/3mJjZ9ufYqjaqUej
	xUSx02QsrHOWvxVB+1bobAFHom3B2nBQ==
X-Google-Smtp-Source: AGHT+IFT6Akj8U+/fFusx2rop6IZ68mcqncMokm0DZX3RkEiNJb7fAdqG7Sl0CHQ1h6bv2pXck96VA==
X-Received: by 2002:a05:6a00:a464:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7e1730a6f68mr1325466b3a.31.1764788217442;
        Wed, 03 Dec 2025 10:56:57 -0800 (PST)
Received: from [192.168.7.10] ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1518e5dacsm21036833b3a.23.2025.12.03.10.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 10:56:56 -0800 (PST)
Message-ID: <d2dfa83a-80e3-4a89-b853-a88589ef0092@gmail.com>
Date: Thu, 4 Dec 2025 00:26:50 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: remoteproc: Fix dead link to Keystone DSP
 GPIO binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251203180337.50831-1-sohammetha01@gmail.com>
 <aab83a61-9d22-443c-92bc-d7caf1c8afac@kernel.org>
Content-Language: en-US
From: Soham Metha <sohammetha01@gmail.com>
In-Reply-To: <aab83a61-9d22-443c-92bc-d7caf1c8afac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for the feedback.

On 04/12/25 00:05, Krzysztof Kozlowski wrote:
> On 03/12/2025 19:03, Soham Metha wrote:
>> The old text binding 'gpio-dsp-keystone.txt' was replaced by a DT schema in
>> commit aff0a1701b020c8e6b172f28828fd4f3e6eed41a
> 
> Did you actually read what I asked? I think you just sent it too fast to
> be able to read entire multi-page document. If you read it, you would
> see that abbrev is 12 characters/digits.
> 

I did see the documentation mention that the abbreviation should use 
at least 12 characters, but I didn’t notice any upper limit mentioned 
in the text. Because of this wording, I assumed longer values were 
acceptable.

Should I send a v3 with a 12-character abbreviation?

>> ("dt-bindings: gpio: Convert ti,keystone-dsp-gpio to DT schema").
>>
>> Update the reference to point to the new file.
> 
> This wasn't here before, no need to add obvious statements.
> 
> Best regards,
> Krzysztof

--
Soham
