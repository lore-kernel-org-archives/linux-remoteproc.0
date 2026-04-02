Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C43B27EA
	for <linux-remoteproc@vger.kernel.org>; Thu,  2 Apr 2026 23:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775174363; cv=none; b=o8X4Ab0ZyKKHSiagFgRLsWd0m0Cl6BjbgaP2mfWAx6ujOWhlSTHFeGcZ7xGNxaAWFHiVZIoJBrDoBwIxHN8F+d8IkjRnyHCFqmGcwQTE/UZh+L5mj86ER+6ye5YfXFPx2bnhz3YcQIZBP0o8ojYOnqU/SzL7BMWmwpnt0Ng+Zr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775174363; c=relaxed/simple;
	bh=DY3O2HwFeTdC1F182DLgbn1OXstRHIJAiV+APzAPx5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZNjCaNu+G91A0FrVXkGkMR5hRsp3wioW4LzmD4skZQ2UmN1FZvo3TqWkAtVet8rI9kbdezTylhAdDyYX1oqyREgJnUf4+HwB6bQEjJt3ZGyofs3Q4iKQAafG36KA/m5HXj0fik/NfsXFJiizYcgHYaS812y5rQ8ZS8G3VnrsMHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsLy7Ryz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsLy7Ryz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486507134e4so18981945e9.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 02 Apr 2026 16:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775174361; x=1775779161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DY3O2HwFeTdC1F182DLgbn1OXstRHIJAiV+APzAPx5U=;
        b=IsLy7RyzzbbXES8j4UR0qVLBC3pxoICC7Dm1CYCd+TPVxaT76ncYFLl1fYd0D3w53e
         uSTiqVT0wGmrpuRBaOwJKIMfxDKwSm0QwM0afL6hNqPaR0LYT0UxxuIa8kASy0/aLSuk
         u4P2SlvfO9iatH/3vFHA6JxW9GfWaxrabc40lE58bVAC4oEWEuqVkFAk3ugk4dpxAMjR
         sqfieDWxGGJqqSSfOqDMFS7qg3UJl32lp2ridRVsYI8MzmLzIlNh4kwjzxDL6FqBENiE
         icS39oU8FLox+bhMn4opkdL8COruua6gtmyYaxuxx3psvEIk/CKUTvRITa2gJXhpRSow
         znBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775174361; x=1775779161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY3O2HwFeTdC1F182DLgbn1OXstRHIJAiV+APzAPx5U=;
        b=nfz4LTwSnX6+VJENigbtuJUhhs7YaaYvXnzQQU2wHrS8yhVPiTVmaCwyIdQj303buS
         SbT3YMYQRjNu0O3cFw0W8O/C1n4itI+zWMHozxaot2KgBJVUj885hZbbZrdassJwCsPp
         seoHyDLnzf+gVkdpT5UgFGgVCjTa2/xWmxkmPNJn/994A47KZqVwvfLWFi40VWwz5o2w
         cxRj+9SDswdj5rGJAa8UIapNm8V+RdKoyPj+tFGTpR8Y4WYnX23Rfg8qA4Cjj1szjCZX
         kiBpqxOGugfX8WBaiprJKbcW29hNB5UIDwn+OoiqCsBK9eGaLAyqO4227IRkKaWZ9kFg
         rnNA==
X-Forwarded-Encrypted: i=1; AJvYcCWwJqcxM6z96SGSvuk+Q4rxerWwTI44cd7E97wVW/tyBiwElkvCFz1YJn6/Zu/HnP1/iz8Nca5PV/OTVbxoQ8Sp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+bER5fFtsdsrb1T00x29r6umQb5X9zXfhl1NRufvOiVi2mw5k
	XcIUvLHWwB6ZAQy8O9iOYts74NQuZC3ETIOOfU9gTnIqbzL/LL66iGlz
X-Gm-Gg: ATEYQzwYTAU6mmZ+kvcCR3AHdBH5kEx1A+ntLjH/9mjdfpbzMK+KwlLbq6Tc1qKBAJj
	6Inyc0cNATzizNe/ic5aNv5YpXQw42vtQ+9aucobKn+w7IqI459AQHKST4kFnisfvLrz+nNYA4J
	EwTewYfJlxwp51VkapG3IhG9LlaMyWsHUqFUffbloscYlBRm1kvn8EsaxYTIq1zNwADGMhg0a76
	QS5rvSeZa17FUXOzvMvfCfAL4RzQnDVsba7D+I3PD8voZ9NXczdDkASOBWzMhUuhkdmkPPU5xA6
	kkeb7+EVzjfd/CvaIssVgAreDvBE0ZDGxNpFcq8rOIazhuIbx2r4SbgDBVFZrd1Mh1Y9khnoLGc
	X0F57nRhdKc3m3Y8nih2z1jeqDimGdqZsxYx9xtPnVtp7xvxvEPWaK7IwDFS1PvqkancUmrK96B
	6c5IZmSCIBZmt2fe3fvQ727sxUApfXcr9+Tx4ZfCzpdXkWHECgYe20XphVs7OX0hjsV3kJSFiH9
	w==
X-Received: by 2002:a05:600c:3b19:b0:486:fab9:a578 with SMTP id 5b1f17b1804b1-4889976af3bmr14508015e9.11.1775174360646;
        Thu, 02 Apr 2026 16:59:20 -0700 (PDT)
Received: from ?IPV6:2001:8a0:e95c:5e00:5d9f:ef76:f3b8:8f4e? ([2001:8a0:e95c:5e00:5d9f:ef76:f3b8:8f4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a72baa8sm98093075e9.15.2026.04.02.16.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 16:59:20 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <09daccc7-0329-4410-ab5a-202ce2c1b77f@gmail.com>
Date: Fri, 3 Apr 2026 00:59:18 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: dead code cleanup in Kconfig for STM32_RPROC
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: andersson@kernel.org, fabien.dessenne@st.com, ludovic.barre@st.com,
 loic.pallardy@st.com, arnaud.pouliquen@st.com, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20260330224545.29769-1-julianbraha@gmail.com>
 <ac7BW9WLn7V9rDEY@p14s>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ac7BW9WLn7V9rDEY@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Yes! Sorry about that, I had just sent out a similar patch:
https://lore.kernel.org/all/20260330214549.16157-1-julianbraha@gmail.com/

and I copy-pasted the description in my email.
