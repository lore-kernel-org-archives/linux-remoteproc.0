Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219AC2D94B7
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 08:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755677545; cv=none; b=nu2N0GsZ/AVK7OJZ3Yibfb2LOjE7zqgQhkUZ/6OxyIzV39PGTvRpjJ4pBEPqOy7vYE9DcRNhGJAGwwTPxWUGxEgWhtqb6oo8JyLRDKzjljqvh05t8jK4p6b4QQaiW4HnQ3oUxxFdFGEn6CrNTUFjDY55LDfBg4eJP/pAS/a1otQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755677545; c=relaxed/simple;
	bh=haxIZUSQiCuxxydJqegXR7kmgNO/8Jz418zQVwNhZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4fvSG/8jD2qbDE/UstFhIv+o4BDAKIMXEFLtzhGMYYdGaQsifq8OJv5bhIN4+u69inBr+6ZR0JlFSQ/mDMxCos0ThquMD+tEj8teIHOly04T/pLDBC0eMW4kVJHjJGySE764RTcOBme0QaxaZAFyn4trfeMOfuotxBQc1jVTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDttB39v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDttB39v"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e414252dso2960866f8f.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755677541; x=1756282341; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=TDttB39vNVgcDXMCRMXQZAUW/dW3b/aSOKOuWiHfEP9caMeZMOHGWFBxYOV8VLkpql
         3jzUn+17e4VwsDQ4cO3Upaemjb9dksdjVTDDBcwmok+Hs6aU1qmFfMDhmDXySqsdBj0A
         v++5HywKPNDRMU6GUMaA41QFD2IFmSfdifuVhQG2tkbraEN+6B0V+qglulxa2oDh78/5
         NRtl9Fk8hIidRXGADTiO6+a5sWfcDXvi/PvUZb9anF++AKsqmUx8o6BThyhCDrQzOj5Z
         YB7vWN2W/DXiWClPPtMrOPZmqE24vik2J1fV74Q2taxaKAkcOlCkUYH+/g4HK1Ov1Eq+
         coRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755677541; x=1756282341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E5mzBsBALiqNSttAJPi9ae9mbcrxgDyj2N9OaXqec04=;
        b=K9nKQqlWearLPjPfXrQYVheS0H20IKF6wRo15LkDhj9X6KBy8huBxR+c0FB1DzHflt
         vf3p7QS1vBoAJ7+8LqSaL8hBG1SLq72wQ7ymqmxUTgFbe5ejfDfD35PzKBSWtKkdn/8k
         mCGP7orQt7oapsf66wi0ONyl32ktdlQhzpOT9oXFXG8RzZ5zSEr1hzv8R9IgCNVZbJqz
         JlDaNgWjel9jMTMNVJhEt+64T4S+NNchRfb947CWyvMDEkxwTlJ9rjgk3SZFh2LpqV3A
         JWuQQqWpEZp22bACatMqizZ/+Dr9cw0IY3fDA4st23kttTdE4JTsvQ/9M4qaB0doesy7
         0kSg==
X-Forwarded-Encrypted: i=1; AJvYcCXgGDnAA8o/7oxZCmfTc8eBT/uCH6RnYrQ8KoMW3G8Gt6eY94z/+B2aOeQkrSvOeDP7Lx4L+HnPiTR/iFpZMcH3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj191qH18fOj1g2hLD12yopArToJyoFQb8rymoEKU20i9lssK4
	/h4hSTO//Be0gAkiI1oxrhrugYLL/PnhoNcHJGRpEPoOF9INSveBj/fkKfUOVuCw14g=
X-Gm-Gg: ASbGncuOaq6l3tH7ctJGE9Ude0wocqg+LCmtfYH6lR67fynC9Mgg9mhQK5l9iCJDiN0
	LsI8nsIXbEmwraey0BzoNDmdzqnm2kwlKXY+o8OUbWiKSKYp82e/2pP9V6RDs738yUPIAyeLWS8
	AhgJYKcQhUPdVstTZW/nuRrax3R/fEqW3/U3TawxtTJpUo4VHOLW1xhgeWy4uKspV/eCIvZzuWN
	n8bRqzkZg3AcCQ8Q1RwtaStZXrvJCSaZRvtN2cyOPacwknhk4OwMIN1bANIjebpWtPzC9cAP+O9
	d4CkVYTlQpC2p9XHgzDjaOXwnpoJFp3H17nyAgPbr1q3xOVdNTMekqwZkN6mW9PRAwfwblrbBhI
	/Flwnq9Zi9hnnaXRwZuwZ9oCZZ/OIvD7ODNQ=
X-Google-Smtp-Source: AGHT+IGuQH165HnaQTwksDDzZkNVZOjiFfhmMoSOhDlESgJ7dUKSOkqF1KC3ciNT1El2t1RjmBhg+A==
X-Received: by 2002:a05:6000:2404:b0:3b9:1697:75f0 with SMTP id ffacd0b85a97d-3c32eccda13mr1347315f8f.56.1755677541336;
        Wed, 20 Aug 2025 01:12:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:8a2d:c0da:b2f2:1f41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c57aa0sm6687179f8f.66.2025.08.20.01.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:12:20 -0700 (PDT)
Date: Wed, 20 Aug 2025 10:12:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKWDXySSt57tXHVP@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>

On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> The resource table data structure has traditionally been associated with
> the remoteproc framework, where the resource table is included as a
> section within the remote processor firmware binary. However, it is also
> possible to obtain the resource table through other means—such as from a
> reserved memory region populated by the boot firmware, statically
> maintained driver data, or via a secure SMC call—when it is not embedded
> in the firmware.
> 
> There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> etc.) in the upstream kernel that do not use the remoteproc framework to
> manage their lifecycle for various reasons.
> 
> When Linux is running at EL2, similar to the Qualcomm PAS driver
> (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> also want to use the resource table SMC call to retrieve and map
> resources before they are used by the remote processor.
> 

All the examples you give here (Venus/Iris, GPU) have some sort of EL2
support already for older platforms:

 - For GPU, we just skip loading the ZAP shader and access the protected
   registers directly. I would expect the ZAP shader does effectively
   the same, perhaps with some additional handling for secure mode. Is
   this even a real remote processor that has a separate IOMMU domain?

 - For Venus/Iris, there is code upstream similar to your PATCH 11/11
   that maps the firmware with the IOMMU (but invokes reset directly
   using the registers, without using PAS). There is no resource table
   used for that either, so at least all Venus/Iris versions so far
   apparently had no need for any mappings aside from the firmware
   binary.

I understand that you want to continue using PAS for these, but I'm a
bit confused what kind of mappings we would expect to have in the
resource table for video and GPU. Could you give an example?

Thanks,
Stephan
