Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260893C1F
	for <linux-remoteproc@vger.kernel.org>; Tue,  7 Oct 2025 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759875394; cv=none; b=SNgQCnavqmHjvMrXtkm6+7CAWHIxHUtMwSMCwXTT22P4MDbEHvxzGaIntw7CRDcD7hZ0xbq5LWiDGJ7FABGs88sz5S9m3/a7QURAWE/dw24AnslTGLtkWZyRwY1bZTLlJGBn1g60iCLfhC+CgJyUo4bKmZYf4/4A5ro50N9YXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759875394; c=relaxed/simple;
	bh=pMHeIuQx2q4EHNUQvUoEFemD+88dJQKlLGcjt4nVQGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=chnvj/yCW2CLBS1l0TrNNTA3djmRpP9H7K3gd3cX46/iJWdgGJp+9WQGaPiWF8O9Fd4ip6Mm55ogc54OtdVzNZ9dbboYGEkrYiwXiEdytFdPF1tlg8DWR4aZ4G+WtENOp+grVZo19Cl/6DLgZ8rmRp7Z6C1iX88ZkBG2TaMRfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kAj2GqOl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kAj2GqOl"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b4aed12cea3so721187766b.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Oct 2025 15:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759875390; x=1760480190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bjhcAIDF8/EQN2DtNJznmQGOwXEZTQMeZUXrCuISBG4=;
        b=kAj2GqOl6HhgV5mNBcoTW4pypt842MkO02/gULfWx/Kr4vpxUhL5oxbndpxCS5B7Xq
         3nfxJgz6PJF8AAqveUym2jFM28rAAnfY0IsQDZBe1OD4jG3U16IheEvyIcu8TlYJmSnW
         dFRRaO80CQwx8ViXQeF3Z6sSFdJHZeEu86oEQhCxwDbgSpklQsUGM85rhi+oypbItX6W
         ZW4nfuq+P1KddlbJbgGvxN4Wy8UuHwk5JhhiA9a7jRK+3+xpdDrJFK+JNoQQ5tjlCWM6
         aSsdlqBL3ulipU04pkfh0axr5HCg69ZqVxnftNG/FcfiCcvFCWp+uFhhAQ/q7AaBdHcY
         67zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759875390; x=1760480190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bjhcAIDF8/EQN2DtNJznmQGOwXEZTQMeZUXrCuISBG4=;
        b=hFmyvTCQcCqkyUZux77KivJyCIbTKt2i1H2TqDoFBMLURszZC6c9YcrE9ip6/u1i32
         MvVaz0/1JX0LXqzj1UeU5A2FSC1cBdw47oDd0Lb6pEoG8qac2b9s82kJVwkof9aXKsjT
         t+IGNaytd+QTtqt8bFhAHN+qUluef6VBs815XHJiWhvpmTcD2VOX4trN8gdm3on9VTLb
         wTLB9aEPKV8/r6KRR02GmXTyXWp61Q7ADHSlwarEFBr84cGHtpl1hadUT9uG4a/rqFpP
         oXLxuEOooRO86hJSc1EMj7DjpF1M5IDPBqzgvVdH6LnOYLIa/w6cMAEZY0zJzZzBUbpx
         qx1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVAqQx5gcI2YtbsYYn6hQLkdzTwiUpy2u/LoFd58SNOvGc7I23VrsXA+iXFPN3iJHGuU5veJa3qH2PEO3CE//V@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo96JGQf8/OQvHkWc8iXEupfIeZQyeY0+JYYJXcVyAT0vJF9mR
	kfVqWNfvtClNGximRcojEHqFm9PhAq1xa59FVA1TOiHg+i1lLQYSQ1qrFvMa7ipHfx0=
X-Gm-Gg: ASbGncvDpWD+H4LrnbLqDEygH2hd84wbhDZZoz+wrltkuO/UZIe5PBijpAG0q14Fjy8
	ES2EOqgaQsefbhnvsS6Cp9CdqYwGQ5UAVT8IX0Z4ngdrOMQK7KsVd9tGL4VALFDvztrEUMs36UD
	byg8lqd9odLVNhdq4zm8jUlRp2QMkldX7W10tDWYWdhGzL+bY7Ej3zez2a50OPmPu2l8qhOubHy
	iRePtkTZ1mWVIq7xuadayn/MUbxU9dm+RG2HSvft2Jqgb4qrUP1IomMqWGjU+18LJFivpADFZpH
	xK7DTkHPz9odVLcAsbcN4G8plS9wKY3lLDLxXJcZ5UbW7K7mLgnMyjRP8sIHREazqLTHo36Ar3z
	sJktNMMg/nzipmO6dQ23rNpgdPrL1cW7VLdbGD9wN8yGlx1I7owe9DgQTcUO3e3k6/oCoko2Cwg
	gjxYk5A37Cg+iaI9v5
X-Google-Smtp-Source: AGHT+IGYcPbzACIE/5EMswc0+sjA3tFOGQiH/oXWXnWgAeZoMqEYeVqq1umjaIwNpexDiKcPAtxL+w==
X-Received: by 2002:a17:907:c02:b0:b2e:6b3b:fbe7 with SMTP id a640c23a62f3a-b50a73c4cd7mr128513066b.0.1759875390421;
        Tue, 07 Oct 2025 15:16:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b32bsm1530188666b.50.2025.10.07.15.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:16:29 -0700 (PDT)
Message-ID: <45eb9c5b-bc8e-4866-bbaf-5afaed9fda21@linaro.org>
Date: Tue, 7 Oct 2025 23:16:28 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
To: Manivannan Sadhasivam <mani@kernel.org>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
 <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/10/2025 22:23, Manivannan Sadhasivam wrote:
>> +void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
>> +{
>> +	kfree(ctx->metadata);
>> +	ctx->metadata = NULL;
>> +	ctx->dev = NULL;
>> +	ctx->pas_id = 0;
>> +	ctx->mem_phys = 0;
>> +	ctx->mem_size = 0;
> Why do you need to zero initialize these fields before freeing? Are they
> carrying any sensitive data that warrants zero initialization?

Mukesh, have to say I don't think adding my RB to this patch is really 
warranted.

I gave review feedback that the above looked odd.

https://lore.kernel.org/linux-arm-msm/9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org

Could you please drop my RB here, and fix the above in your next version.

Also please add me to the cc list for the whole series.

---
bod
