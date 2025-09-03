Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417A3019D3
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Sep 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906322; cv=none; b=gfP71Vkzbuscx+uMr3KmJHzH4Z+3HBzEne72nQU+eu1jIQMq4IG1LrKpbyWC3fipzo+A5FcY69w2oK/Mcp8/wK4zY/iR9Zz62V5QJa0e7hRwVrGs/MV1DqAj0ETPD6Uf78ZapXpzu7jCSg6mUFzczH9i3ajiYDjwaMvyvxIvXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906322; c=relaxed/simple;
	bh=HMyrqafZWVvnCp8l3xl9EjMdbJHyX9qnKtyEFsPn8dE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=krBDDfeCUYkNyH0dihPJ8PCLL2XipzpmLeIFcaA5ZSEPeTVIj8nSuVnlTCL6vQe/cDCdHX84J6xhhpbAz7nl8tBhp0vIfJSu30J9XjHhIEWkyF2aEPPA/5FeUaKjSZUH6K6FO4g0By6atR3cKZEGr4u+c/h20nEVPW0f6fnIiSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zK1y7ofR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zK1y7ofR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so3856675e9.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Sep 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756906319; x=1757511119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=zK1y7ofRkabpTVTCK72t1pu/W63oE1k9cWiQ7iCp8g6fJ56OmbzmKaB+VGNKqm+k74
         RstJas+QJu2w5nvLmF4MwLl0M/Q8ETcXt5DSXHJlcW4W03dhGsfoD6IXKgqZlFKhWY3q
         9TIyKEBiFY2RcJ+cyPlpUKB65IimGqbZ0ejuUyM9VKd03F5oY69T623wErhxaflnw48V
         7EXfQNnsDwkd0uTwHR+4MV/NCMoctN5+HfVYyFcq8nd2AfPhs+IX5A3yCEt0AR6hhWuo
         +tuf/SgYnGUzpfUKlDUTC7NmZUD9xSS3co5ihP6W2kj5CmIEknNA1owGStToRsNoVs0Z
         8Hlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906319; x=1757511119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jV/+kNQU+fID5A7W7F8ncUimxdPkwRhQZObi8KDWFN4=;
        b=CKNs1wSEw3rjFLn5XiYniMp+xxfcMy8C6X9mwsbkgl0/6H5W3eatAj43jrtYpl3kBz
         PrhM1bWCENUpW0/hgJYbuIsgAb9kB52Uh3y2+X+Q1y6Mj6BwhJaT5MdCFzN+ON/I6Kt3
         +LQ4Wc6azrnDvvh4IW2hUtVtA/nUdQGefl1wkXjgdmZLaSS7I0OZx9XsQWsTrPvtSF2D
         xVMPJ0JXgMWIYJulQEfmws5I5Xu96EM6rYWhJMJrv39C5BnMJG6GUc5CLB1qwm3MVLNd
         X2NkSXWpwZXL55vMog56/8Xo8+aeut70HE5epsktQf87STB3YJb/7E7QYhraKPOlbbFQ
         HFQA==
X-Forwarded-Encrypted: i=1; AJvYcCUlmTRZzZxHKg7Y87oodZdUIQ2RMfMnatgoV8y7c1CPsJBF5hlVIdY10IO5doKbOx4DgsMP2hPUT/NkZY4Ufj/6@vger.kernel.org
X-Gm-Message-State: AOJu0YwTB9t43kmAE9Wp2YC3w7xJsQwXJhnoLqFC24rjVTZCUXZKt5Eu
	FzNJuwFQx6ENj3JlPpzavet0l6KcYkl7nZEvMFz7CoOeiY+ogOUkiYflGA/+3ZDVV5E=
X-Gm-Gg: ASbGnctjSilQ+Iq5u/UKBwXvQC+w7NlS/GDFqvkAB657aEdiOxvcOuIlv2sXJKvf/yv
	h7i9h33/PfrODMswKcaUrBLMtvNjj2VskJ7L0lXs4BrjZgkVfHJ9lb2t2pivIEfG05Ca7RFFtaR
	n/+7CMd1wMdSGCeUCW7hpmPOYN/GliYdj0puHWYpE9ZL7jzg611DLTLDhn2HdsOOe6YZWpHIkXM
	xCR6gVNB78TnuP/Ay02RqFxF8mgBzNfhXLWKD63HRVw6cCKoMdXxNrK7Vu3Uocioabx7E1T5sCB
	CRXrK3sWmsqrkfgbfZah2PfuEsAAQdWaCUeJj3312WD7X5sAtqUJv/Z+/Q2rTe3E8JgLFxHNYl/
	ntjUANhYU3e89m1UG4jApcSrHPPqA3ZO4GHf/h5o/PWuQwiLtachns1wWTE0fQBQBHNYLsgb6Iy
	GnXtGyyY4c25S1gtsw5VHeQ7RT+kjzuBky1S5JS0VR
X-Google-Smtp-Source: AGHT+IHgsBA9rledeTVeo8KQley7QFRDXyCYgnqMKEv7MzsQIBH95kbaAiwwLJ8XXVf/C9Q9lEUUqQ==
X-Received: by 2002:a05:600c:46c8:b0:450:d386:1afb with SMTP id 5b1f17b1804b1-45b85532ec8mr134876395e9.9.1756906318707;
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c22sm327450385e9.13.2025.09.03.06.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 06:31:58 -0700 (PDT)
Message-ID: <b5a0ad0d-ceba-40d3-a111-0831c4538cea@linaro.org>
Date: Wed, 3 Sep 2025 14:31:55 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
 <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
 <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f5582304-8f55-4c3b-b752-9cefa1e4df96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2025 12:56, Konrad Dybcio wrote:
>> Can you try with this next-20250814 tag ?
> You sent it on the 19th, so it's in your best interest to run a quick
> 
> git rebase --onto linux-next/master $(git describe --abbrev=0)
> 
> and giving the series a prompt re-test before sending, because there might have
> been incompatible changes, whether ones that would prevent applying, or break
> things functionally

I can't even find that tag next-20250814 closets thing is

| * \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \   00062ea01d35e - Merge 
tag 'drm-xe-fixes-2025-08-14' of 
https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (3 weeks ago)

but patch #9 in this series stubbornly won't apply to any SHA I've tried.

meh

---
bod
