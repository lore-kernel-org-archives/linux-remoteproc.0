Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3F4346E62
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 19:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766519277; cv=none; b=omuxfw5+QA0E6U/fQ2fbEdYov7NfvD9HhCy5bnOdRpaQDLwzXwjsZ+W+mNWF6+0Ii4fdHCt6iKTMVTnTHHSP0/ZIPItMvY57rEI9ScRFnqEXfYrGfGy/rTCqPXtsYWZlR0WtZTDIjJXTEQmIAGPAr1+ZMa8HoitG1H3ZLTLfLKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766519277; c=relaxed/simple;
	bh=O+al3T5GzHGSlUthhDdnNmN3jTqqvKqHzxLvsIe+qrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o20lBnxv24zluiGEcrY/cfK5kk8bnWBisJ4vv32SwdcBb9lySd+5Kz/KG7LjjyWFZQ36DzJOJK64+2GIRkXDgR5qLFfXhYFFBUs7oOb+L9ya42EGXGA3hPtMc99r4Po8NrFCRTDrH2a+exr4BhDRxFLfWhnTWANwxPkV+eszSrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXFWLLIM; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXFWLLIM"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3e80c483a13so3802158fac.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 11:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766519275; x=1767124075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3mRJeRPuNplyzmtQpT+uTf1WmnP55bf7PHuhNJ2LCk=;
        b=CXFWLLIMvJnxkqVhl3qf+hIIVPPt5ZKmDrDA7ZV/DOpjTjEgOpNdkCG+A1dT+5u8ro
         xBdUxmdH/vt3sBPZ3O90WglZQyfxYCHVUHvVG27dTD6B5lwqlEE9pg9gOIqQM/WaGiON
         UBCwebTgRFg0wWscS8nzqMcUh56SP11luotZjZ6YfJiZiEPGRJT8rO26GPnwfaBnPY8W
         CGD2lpgl2tfqtnSnOeeetRkEf2Z0w9d29kZlvRrJe7RN8+14ZRRPUKfG1T6L9zMDGOxw
         RA1OhwRvpIDaFOi1ds9pp2MBfbVCDZoS/81GDBl4wLukE4kgev8iYcrLjGM23aDHkCBP
         6nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766519275; x=1767124075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3mRJeRPuNplyzmtQpT+uTf1WmnP55bf7PHuhNJ2LCk=;
        b=BGrswCriUCFzjIAD21BDLGYeFO2zeaNZtKsLPKudn7x7uQDhUfEQJZ+AcVctE4MI/m
         FpC/mT46qlI+OahJI1SA3s+HbXkEnrESAcD8TyFfyTjslfrHQ23njzYVHFADVwf6lR4v
         c7CYZIv/qtGKnUeVAbkM1Dyky5KXNM1jDz+tcOeDoUX/DVa/kv9KXQT6Z0EbKI0uoBsl
         SX2AAEvbM32UV7p1yL2YneHKPwzoHLLQHKhzGiypxYneeqq775MaR2G+wFQfCMMeP7wt
         9USRC2dCZsAZpPhHnIL53zUp+SkAdMsXan/wu47oyhlbczSsKkh86ovByZ6tyNwlrxaB
         Vf8w==
X-Forwarded-Encrypted: i=1; AJvYcCX/wXoDSm7BOsXP1Pmfn4Zvp7c+Kf8kJwYZnIXMqT6FwwfbwBOwf+Qq6NlpRMrNY1tFK5ELoRTBDRiqHHonMIwy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzdw2g3l7PY6UaPX14N7w2EHSOlcnakdZeP+smTtQfk0NdZP+Y
	B7p62pXRB33jEUiXjCNyzupORRV60DV8U/NIZgsMtO9HPCYbP9HUHH30
X-Gm-Gg: AY/fxX73LkaF2S/Vq/f+VQ9/rCo/hHtsSSBtrm5KTRz916Bus5Ez6M+Suic0JGRuDe1
	3J7v2UcEpcYerBmOWhoU5I8M6UsxKhY45XFBYYQM044CSH1f89ubWIilWg5VgHuYgZcatQdkcQV
	8/5snhBPOt44FVVTK4Vwj+gutHr56QaSUNSnKbdsYyXRDzDV6t0Zwi5g8O5lAGk798uYNeqkSnr
	m7Oxlx5LZ54h/0vg0mcHkn8ElErlffdsk/DHWrP40YsfzW0VMi4CxLaeC/FzexPRsJ7szdzPZuK
	i+4ey6vlg2vrhPQSm7G8sqF7bwl0+bfQeuRxqxisTHf6Z+b2bSWXE9VHH+TV0UjzfVBCWiJ8qwR
	zdv5ngf9jRSe/bjpzvB/+hPovab9d+EODDbxZJPDoERCYuTjivmgzNtKiRWzB5o3O5gj7PZBtrr
	mA9DPdmOg30Xps/Di2AoJWxs73hQ/MJR05wcZQfUmXuH4fT6TL8y03GwnciDtI8a80DVs2/WYlJ
	01oir268uErzSMl45wF8vxeJmKnW9pQjSfNf4/zug==
X-Google-Smtp-Source: AGHT+IHcrjhYUuAj6vozocg7gaQdzG5Vqlzq6aaTKhOSW+rv6kUgyk2MG7UftkvU7tvQ1KVlt/vjsw==
X-Received: by 2002:a05:6820:e010:b0:65c:fcdf:a350 with SMTP id 006d021491bc7-65d0e9bae35mr4930818eaf.24.1766519275181;
        Tue, 23 Dec 2025 11:47:55 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f69b9e9sm9066832eaf.12.2025.12.23.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:47:54 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image loader
Date: Tue, 23 Dec 2025 13:45:49 -0600
Message-ID: <4260401.mvXUDI8C0e@nukework.gtech>
In-Reply-To: <20251220-imaginary-merciful-quoll-a91a4c@quoll>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219144433.GA3163791-robh@kernel.org>
 <20251220-imaginary-merciful-quoll-a91a4c@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, December 20, 2025 2:54:02 AM CST Krzysztof Kozlowski wrote:
> On Fri, Dec 19, 2025 at 08:44:33AM -0600, Rob Herring wrote:
> > On Thu, Dec 18, 2025 at 10:34:10PM -0600, Alexandru Gagniuc wrote:
> > > Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> > > to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> > > enabled by the host in non-PAS mode, and are not optional. Add an
> > > example that uses the "qcom,ipq9574-wcss-pil" binding.

Hi Rob and Krzysztof,

> > Is the new example really much different and unique. If not, drop it
> > (especially since it wasn't even tested).
> 
> There is simply no example for existing devices, so this is fine. It
> could be mentioned here WHY it is being added, which would solve two
> people's questions (yours and mine earlier). If only people knew and
> said WHY they are doing something.

TIL, I need to put the third patch ("dt-bindings: clock: gcc-ipq9574: add wcss 
remoteproc clocks") before this one to resolve dtb check issues with the 
example. I'll also add a blurb to the commit message to explain WHY.

Alex



