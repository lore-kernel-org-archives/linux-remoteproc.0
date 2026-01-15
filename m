Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EE02D7DD3
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Jan 2026 05:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768454880; cv=none; b=gigYsHoDK8CeYYJYaIpQSFkysFlpj8W6+T3w8XHxP4ApbzVW1u642piBdVc1sjb3Nqadn9Ifgv3DmvdXDUZVtkpeAC7Xa1GqXLrPh4lbtN8QA8UqL1Om5gu2UiUm2QiaYPWpkhnCIvM2RwZlrLnso1jBMge8At12R2wSKfuYdxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768454880; c=relaxed/simple;
	bh=oQqaoD9CWxihva9z43UC4l+nSw+HBzDnr6z/ms6gO2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxT2TCLBo42PL+HvzExZrOPFjV3S2PdaYvg9RmtwExUkHpcKX1jU2LohNUSnnVcPb2CWcZ2oB+k8coD3vkC3KsMiuXxDoj/IFQ/u5ewWHDij006WiJVLcNeAkiQ2pM6+7APlJjy6+X5XXCZcSX8agxGIPSGIt7ewVdugLqBKuvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2fDgReC; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2fDgReC"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-45c8b850f96so226827b6e.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Jan 2026 21:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768454877; x=1769059677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hja+osRR3fdOtBUZSkMF+9cn4r00td+5ctV4DGDt1o=;
        b=T2fDgReCIOabBORtFQ5rg9UknhjuKcCscoLJjwYd70GsczUK9izNhVlA+mHXsQ4cOf
         7Cm2W0eY0m7dBynv0MygZUFKcs5dncGSSTLVkD8/Ui/I7+fHf1EzW8zZfJc+R38Dsexr
         FFPQVEo5oX3bWrv/JjHBgFK4iPQwSp7hxj9+6gd0TXcMVrDToOxlSlXF/1vi8eEWNNYW
         890m55QXNTV4fWfhQIBGFDzq+C9tOJACFaZNjmQtgeE4s7lTUSQxmOz5mC8Na+i5sOsG
         9+OuihdGM0NdFj3XJgpgyONtFfHeWGmWChoM3yspBjU42hLAqLfUmvHZgFQiQ6hc8sJs
         aGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768454877; x=1769059677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Hja+osRR3fdOtBUZSkMF+9cn4r00td+5ctV4DGDt1o=;
        b=Y867eR0Gk84CsKssXXlsGXOaf28sbMwzsn9jBbkIHD/JdXQaqk283icV2By6xSGlWY
         Z1sUHH6Qvu2v3oPm8rFzjsJqqD/Wh1QoOq/Dy5ZvojvSpCCZuuomMyvnuEMEeN3gLvUz
         LGyirzfx31Kp5V7Fyj3Xuz6DPRvxxjtt7gtt81nggM2aWnRXh+J2bTuWPdq1/sJRl/dT
         vEEyJ1mxAzyUdo9H9PDcyOMQ4bpzcUcbRIAnUa20JoAfjwKNI0O2CsoNycKt9WO97fQU
         ylM5hE6y04zZAteL0mSju4fyk1bfA1IYzPzpWAOHiFi1B/N1sdpe/zxGpJY6mQEJiETt
         aptA==
X-Forwarded-Encrypted: i=1; AJvYcCW+pwOSucMFN17nQt6K7Aab/VojAAJl4meAxt0ZJvhXZ+YYPRkW0aK9rporkN0KbbgUEC+ubT17nOA0+p/uezwI@vger.kernel.org
X-Gm-Message-State: AOJu0YxLwvKFONerTcgzAywLTEuz+h4wBFWbvYIi9ZmcxZMvAHZpym5e
	8nxZPDgKXL5ci7R04SjaaSFzTqMBk43g3B5I0EsKoCGfJ3MjY1joe86X
X-Gm-Gg: AY/fxX6+ndPQp6hRGEKizl/2jvrWEqaOtG0HKIbYEgANWfVcTk8jsVBb1faU36FGedC
	p+HxVi8bHnI2n5qgP692dDQC1hc7Ovk/Bq/nykwihwkQorvbNFM4qxU01HEF3o6fMgSyVIzh0KP
	qgE8O+XND40bKruIb3pNOzxpgZtMueFSxYISQpUZ0uHI1qgRPj4FpJF3OHi8xffSdStS2tzX105
	h72/E/TX4F2I9r6Coq1g9jvkMX+Jh9uelNlXkd7xJe6ilOshWGAUh4q3N+X8isAd8LJOR6lCuei
	/K/cdkEso4B7c584lKgytNynEEtrOlUH0HruEnjbmriKmLHaREz1MRVEJGqd4+Yw7M0NmY8pV/I
	NjypBfE+c5p+ajqfdXUuRzmxPodcvB970GHRBWtSxGV2nX0em4yKosEXBbEK0w3kPwjt9FAWaPS
	kQhoDPqYQebIzoGqRzjpHBww00kcAev9DzUVencJiGU+5H78UKCDOR7Expfl87OCW/sRnmUgal7
	tjqPZwHrPVuG9GPYMl17bXLwCuJWxI=
X-Received: by 2002:a05:6808:a585:20b0:45c:71ff:1f69 with SMTP id 5614622812f47-45c71ff212fmr2335636b6e.50.1768454877438;
        Wed, 14 Jan 2026 21:27:57 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfd68b13fesm803256a34.3.2026.01.14.21.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 21:27:55 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Wed, 14 Jan 2026 23:27:53 -0600
Message-ID: <27098742.6Emhk5qWAg@nukework.gtech>
In-Reply-To: <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <4814455.tdWV9SEqCh@nukework.gtech>
 <577d547e-6311-49b3-9c74-84797b281447@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
> On 1/14/26 4:54 AM, Alex G. wrote:
> > On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_wcss
> >>> driver. This firmware is usually used to run ath11k firmware and enable
> >>> wifi with chips such as QCN5024.
> >>> 
> >>> When submitting v1, I learned that the firmware can also be loaded by
> >>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>> makes sense to have the option of a native init sequence, as not all
> >>> devices come with the latest TZ firmware.
> >>> 
> >>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>> right thing (TM), but I am not fully convinced
> >> 
> >> Why else do you think it's there in the firmware? :(
> > 
> > A more relevant question is, why do some contributors sincerely believe
> > that the TZ initialization of Q6 firmware is not a good idea for their
> > use case?
> > 
> > To answer your question, I think the TZ initialization is an afterthought
> > of the SoC design. I think it was only after ther the design stage that
> > it was brought up that a remoteproc on AHB has out-of-band access to
> > system memory, which poses security concerns to some customers. I think
> > authentication was implemented in TZ to address that. I also think that
> > in order to prevent clock glitching from bypassing such verification,
> > they had to move the initialization sequence in TZ as well.
> 
> I wouldn't exactly call it an afterthought.. Image authentication (as in,
> verifying the signature of the ELF) has always been part of TZ, because
> doing so in a user-modifiable context would be absolutely nonsensical
> 
> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
> has been there for a really long time too (at least since the 2012 SoCs
> like MSM8974) and I would guesstimate it's been there for a reason - not
> all clocks can or should be accessible from the OS (from a SW standpoint
> it would be convenient to have a separate SECURE_CC block where all the
> clocks we shouldn't care about are moved, but the HW design makes more
> sense as-is, for the most part), plus there is additional access control
> hardware on the platform that must be configured from a secure context
> (by design) which I assume could be part of this sequence, based on
> the specifics of a given SoC

What was the original use case for the Q6 remoteproc? I see today's use case 
is as a conduit for ath11k firmware to control PCIe devices. Was that always 
the case? I imagine a more modern design would treat the remoteproc as 
untrusted by putting it under a bridge or IOMMU with more strict memory access 
control, so that firmware couldn't access OS memory.


> Konrad




