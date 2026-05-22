Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2722A376BEF
	for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451639; cv=none; b=akM5enH78IajpaUnejEiOFtsXCv05Cs0AmWC9v9lwiFLQaptxjebT4YPSqg09d0+W4bFFkdkOLGYB9M6sBle9+je8WWYiahxGTR677wCDuqQVdNGGFmtwy9OdY2luM5BXOwYfse3NahACWCasgvSpQnEsn/gowZWifytr1LZwCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451639; c=relaxed/simple;
	bh=8igC6V5gCG3ORklcZkPqAGB8ALlBsuox//yt23Usl/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6p3ivLuIghbGX7TkbUhrM9jIyV7/kSmrbmLtTfqGJq9snMSLRHfMwnzqBcBqkRKfapIIWzVtXR4pjwAM+RVNKz5mBI11p32vTl49h+y3Wjutk/EMYH4gxfoW7mVmsk/phNPW9JEgt0o/pg2aLqMqnqpk9kVCMvrjmNdJ3Qpth8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xrXiQlFa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xrXiQlFa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3621576f8f.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 May 2026 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779451636; x=1780056436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=xrXiQlFaPJ/aLpbWyCLckZcJYzAZ0DHMvhSeQMnPl04u9uo62gl/6y6jHbMcehvrTc
         VkEOcuMSU78CUwhaLf61XV1kAtBWm6v4o3yr8lCGpKNMI45gxKYxMyGulXAmZ5dxNKx2
         ggFJ6Y05/bAw1WOzUiWD0RxZVXN5WU7ttsseAO0QdO6C5t8CzZF83Zyyp9qF4XaxbaKd
         wHt02U/XPME2J54LjCnMufIhmXRPML1LUjQXYHSbZ19t3u0ES8hjMYfkvtAgt1y95B2p
         xUCQdL4p9yBDCCVwQXHijbDz95vlaD6DCqEwrnxLEZcKZsn2YwttybTdbg7YkT4rPPyo
         /uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779451636; x=1780056436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRpKrzH+DoH1DNrXivPjGcJUPcnVpmZeapPmijxinYU=;
        b=StIH3qN8NO02JBOBYrbDWFQxGxMigNrfrx+3wvorSbUGGTU8WVt4JlhGMJH5UHeDxS
         omRIhKTBnGipd6U8pXPzHpsFx9vCFQlwyEgtKu0tyaFK7UCOIdH79V20tDjHb86vE2oU
         7TdA3W5+w6tab447NTYKu/6pPodcZ7Y19wCeTuuKlShVXE1YakyaPkXA2q2BbB/XnkpW
         9SK9596HcnWkDbdyHyynTAipJ81H/zsoB0BTp563cQTyPP9E75xFnLMnDXUbj5uLaGUu
         cGnMc96/HDSdvvT7GFZJkdQw759CnBQvHDFSHOH2W9lGlsk95QkDpOkDz+f64YvYGXZU
         er1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8l3FPW/PYkuXCWyMktmh2jDV8njfpOoLn0vEQNsHygwIk6yUW+ZT9EQ7fu9aEAudlK/pNueG3nXZxvBJake+aQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxIMXE213SqI5Xx0bCABtIdrfHmQn9J3r6x130m776ZOwsYfCCr
	bx+kAPR438OvHIVx02qk69FdmYghKORqAjPtU2EN18tvONhyGNpeWTn6RtBkcwmDXOU=
X-Gm-Gg: Acq92OH6fHndzXYBTubayeaO2WXRi4fdJAI/l9yMcu5btNrrPEuzgX9FPYn5Ai3NdBF
	qc0lju6JfBfbwXLCYYZ64EM5T9eeoFtMSpg5jXcfXL5JyDk2830NzL+0bGN4sg1usY26YiFCCFk
	F2FTidDgZxoh2vMcfkGIRXBJ1dZWX+JWAcxAQHexLSLTR/MCrom00e15G4C8n8PbDqAzx7UtmYJ
	FapALHuOowM5HJpVfKbTSe2AUSbei6j1nnEGK8dEwGkyTmFk28r26YcNh0NyHooaiHhqVlKsSVD
	/rBlgylFHZxb7eFzRU4/2PaiwwxfhKdIdniY/6hSwWFeBFSrvLKJpxADgxhHiKDKmyXK30SmnPf
	QmmZPUZTfAggy9QeUCducUEJpwQC67zqmlcQ/7LZzaeIMDCEz+XyfZ36R9QzsY9JWyyWa2bc253
	W86tloeztzJS351JotNLrCC49kR1ik
X-Received: by 2002:adf:e009:0:10b0:43d:c95b:c46f with SMTP id ffacd0b85a97d-45eb38bfdebmr3493505f8f.38.1779451636530;
        Fri, 22 May 2026 05:07:16 -0700 (PDT)
Received: from linaro.org ([77.64.147.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm3678635f8f.5.2026.05.22.05.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:07:15 -0700 (PDT)
Date: Fri, 22 May 2026 14:07:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	shengchao.guo@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ahBG6jKYdSAboWjs@linaro.org>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>

On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the ready
> state is detected, it will be marked as "attached", otherwise it could
> be the early boot feature is not supported by other entities. In this
> case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> can load the firmware and start the remoteproc.
> 
> Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Unfortunately, removing the ping-pong functionality that was present in
previous patch versions makes the whole mechanism a lot more fragile.
I'm not entirely sure if this has changed in SMP2P v2 or more recent
firmware versions, but in my experience the SMP2P "ready" bit does not
tell you if the remoteproc is actually running. The problem is that the
"ready" bit is asserted by the remoteproc when the firmware is ready,
but it is not cleared when you shutdown or forcibly stop the remoteproc.

If this is still the case, you can easily reproduce that with the
following test:

 1. Start the system as usual and let it attach the remoteproc
 2. Manually stop the remoteproc in sysfs (echo stop > state)
 3. modprobe -r qcom_q6v5_pas
 4. modprobe qcom_q6v5_pas
 5. If the "ready" bit is still set, the driver will try attaching the
    remoteproc, but it's actually not running. No recovery will happen.

In this situation, it is very difficult to detect the correct remoteproc
state without relying on an additional query mechanism like the
ping-pong feature.

You can make it a bit more reliable if you also check the status of the
"stop-ack" bit. This would tell you if the remoteproc was cleanly
stopped with the SMP2P "stop" mechanism. However, that will typically
still not fix the case above since nowadays remoteprocs are typically
stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
case. I believe this might set the separate "shutdown-ack" bit though
that is described for some SoCs, I never finished testing that.

And even if you check both "stop-ack" and "shutdown-ack", that doesn't
tell you if the remoteproc was forcibly killed using
qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
solution would be querying the PAS API to tell us if the remoteproc is
actively running, but the last time I checked I was unfortunately not
able to find a documented call that would tell us that.

Thanks,
Stephan
