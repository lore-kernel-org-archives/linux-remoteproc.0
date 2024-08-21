Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A91B2ED3
	for <linux-remoteproc@vger.kernel.org>; Wed, 21 Aug 2024 17:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262514; cv=none; b=HrS0Y5bPlLm2Fp4rbqfx7nPm0k+frh1D998/HWoTpmF5SpIcMkVCl6qxGdOg0hUo0gkmQImXUKWcvZbykYe2PN6Ho6QIcPwkaNpdryT0A1RUhLW9BFd56gjL9rRMwA8mX+ZF1J4rE+AVlytnsLyE+HlfwVNYOT56OEFSwuJMV6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262514; c=relaxed/simple;
	bh=MBVa0Hs28NpfNKOLcOOc/41VgigsOtP9qD4ldUqlXjg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=InJ7sDZu4zYASzH1C3FutEY1Vxzf7tPMu+AtrqtVRlT6tyP7Kdr+4EVGPR7QSrbzj6lC5QKEXnrAhDXlaQMT9/ny0rLJwhT7plx3OfIZuzXe3GXS8sWJQvAcC6lXVePd18VsvISCp4iVNBpj31KNo0+XJasHxcUvALif13/pPtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qg91vuRx; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qg91vuRx"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334879ba28so1263871e87.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Aug 2024 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724262509; x=1724867309; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MBVa0Hs28NpfNKOLcOOc/41VgigsOtP9qD4ldUqlXjg=;
        b=qg91vuRxCrI88NyyMh9QYgDdoo+E6bEq/F3+v3J6RkNXao2kIUJH6bqQ9w+Gxzgeir
         OuYTgBIvZkDxxSpx05T99lye6nIxnSk5mNsf+SsH1nCW7hZvFByASXZB0tPxmLdpZvSf
         kOH2oTo5o5DbVOguqshCSWJpy2mY42JFyr06PYMOWr1Gud2NItTR+5N1njR0JUcqQafr
         jN1+tfSOeDaWLsQSJD9EDT99ESszhvw8jvuEJjPCW0XI4oCYVgrtPYQ9nOzZUwey0x04
         0lYlNa0rBBoXJAbeXpIoNwHBpO+8yMOmv9kf2hPWvw/QllEbYXtB95ydjLFN1yQc8byH
         5POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262509; x=1724867309;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBVa0Hs28NpfNKOLcOOc/41VgigsOtP9qD4ldUqlXjg=;
        b=uweKgecn50Ug8u+LyzHxddvIiuFAUF3Zp2CDlIZdcKroPjwzRzvt24fOrcSL7GHay7
         2crRDGfoPBTwp4wRy751PPptBoC2dMeQVENX8vAZUyEF3JXDcAJ5ebJemUuvRS+4wfJ8
         K55vVaopOHdzMcYvfPoarkNNuip4aRlpB8aOY5nPwAUZ/SUWgGTvGn5/Y+eG2V3pAtDK
         PQigOfNkWzu2YAgQdW+OWrOIRPtvKN0bRaaIoS0sMPkeBke3W0cl19kDvIc8t/25sj1r
         DhXxdSCXLTHKBhrB3lchrMygbSh9IoFVGKwzVz50DseP5fvwMXl3/EY2Yi1VziyzcclH
         EONg==
X-Gm-Message-State: AOJu0YwRZiSx30c5ETvouhNkvF0BlsqM2nCfJAMAaucvrdWkph6AfyqM
	iaxbSr9mpW8h03XF/Kri2WO9kDCfYkEAj2oNG6CqPfhbQ9psiRZOPPHVNo1MTMNmGRuqEnqG8Ik
	keFdCpQYDFeIdOmrrYOtnyh/ymT5imaAmSZC9/qkV+o2nWSz7JXc=
X-Google-Smtp-Source: AGHT+IFRMeXY8pRvvs0prbfvZfMdPRQ1EsgtBP6NT3xQ3Z/QRsxoJII4kY1b68EgdD5bKue/CjqTAWQ1TcgDBkd6pGE=
X-Received: by 2002:a05:6512:3e04:b0:533:1cb8:ec6b with SMTP id
 2adb3069b0e04-5334855dd4dmr2149433e87.27.1724262508791; Wed, 21 Aug 2024
 10:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 21 Aug 2024 11:48:17 -0600
Message-ID: <CANLsYkzFUYgwn92GWB1ntmSXdVo_5R+r0niBQVbfgdp5noMyxg@mail.gmail.com>
Subject: Remoteproc/RPMSG patchset review order for August 21th 2024
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

[PATCH 1/1] remoteproc: Use iommu_paging_domain_alloc()
[PATCH] remoteproc: k3-r5: Fix driver shutdown
[PATCH v4] remoteproc: xlnx: add sram support
