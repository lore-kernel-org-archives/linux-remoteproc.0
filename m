Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE0388E69
	for <linux-remoteproc@vger.kernel.org>; Tue, 22 Sep 2026 02:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045550; cv=pass; b=HuwmirN6gMg/WJXq477OwszqhQJWxaZbd4TLSrUCW9Uq0CiM8gjztXYdcqbjx9VUXUmtE0+Up4/oX1lTdf/CZul0jjgkWQPDJ2J2t+zqH0RIdmdgFuKPyY93RRJgNF5SA5DlsF4Gk39Mejg20ZVq3xy9ZksJ1kA59U2qKtX/Mn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045550; c=relaxed/simple;
	bh=vZgcNyGoD2xypSKwXw/Ad5tVtETNlWG6kTClMXEsd4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdX8xODJ/9fkkkmrYrfiHMjcczgepaNXtshvGXrDWdqjkZiEMuzK2dbbiPSE0YSNHas+yGgJV9HlbeaHEnqjfT1FiHwCwLuEhzUKZECng7T+0s3VxJ4Dm/Wpb/0TUBfnruqgD0fah445MnZMh1tbyIXDYvNMV4wyrm7iaopjIJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfeXEc5U; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfeXEc5U"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66f7f72a284so3573423d50.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Sep 2026 19:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045548; cv=none;
        d=google.com; s=arc-20260327;
        b=NRor5eMIxUiHC24toaEfHQWHoF04xPtNEkQALYrhzxBCB+wxOk+RH0VAzSwoRqYkWA
         itTbxEFFhDxSJp1QMZBGyBv6SAbFXQf3kcBYQt5Qq/e7UO4gF36fHUnK3yGLH1xhnxin
         eaynDyKFzuIvJwu3OTDaQsGpIgk4hLNAZHXn185MLRm6JAWn25hHu9s9Dq5hBd6iQrsM
         yC32v/E0KU+5FHLC/Fv9TUAyl30KOA0jYUhpT9Kk48r0VxwN+37kC0b61BiXpXrkaPSo
         lOicu5y03lWlki410lkGYN+fwA+4g1XNnghczgpP6HM7JZMvuNvIAhybBIdsBKfObCYG
         X0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        fh=qMBlsJ8le2n3dp0xBCbx1o7tVBBTz/cDuIj1Ws7yDuc=;
        b=Eoe4onlvVcE+2K9uHVgLa0Xzqr3cl18lJZ3j/DYtzVe6kE+6CYRyO6laW18mXKNza+
         4TsPoqqabMBewNrW69lqHaJfi7JnnBTImL7HbQ+9gemTbTmpKLAOFXAFywltSqfEZvSB
         S9LMFEee48OxUyx2fAi3NkkvDZBYoeh4W8myz4aNog4xk7UriFsBDnxwgaclx1SmfBZV
         QeRRIcJVs7fxM6V3ng+sZMoiL4ptiV+covIjY5gE8mb4nhyTwGjH60y+RdClj9tQsFqF
         gVvKYd37Q8fcbmVkoQeECAsa+erEG/c1h08ATsSQXTtn+pCVXAQIcCv9UtKO/gxh+Ap0
         GG/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045548; x=1790650348; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=UfeXEc5UOrPqn+cOPfea66JiPCJSV0pIfXRJqG1p/DeqJW+6Yjr8Z29i4Ce4gX3YZa
         WRyb3O8R3jprr1nJXYMrQiK+RM0RNj7YVcKk6yU5no34XQ/rk/MFuqGQgFwTGt6M4VQM
         U7gDEqwAUUKFgUa3Vujp5trCzbSEfGpmGvWVGQDrQX+i3hXj0MFk9xqNIBBIZzAXHKMU
         lP9hFF1Up9lcRq4oTL2QWufe5XM1SK2tJHBntx7uNDQpF1eAnpuVC9uGQW5w0Gw95VYm
         1wPJhhq/OtrBHEsWwPVD/4bYA0RAxOBTLkFedhR5AtzARXk0JairK+PEOlO7KYT+hh/v
         dOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045548; x=1790650348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ghvfyjQSQHrPZknarysRzqoTzq1YP3d2PY2Mg+SWx4E=;
        b=ltS+duD3SRk7qpVO0VFBus0PgTcBJi6ykYHLjlTRzEJquExyXShkw0F/zN7d3ZjA1C
         dncqjpPCdpePT9keQeoaAf7vxk3MJXqKfKpcoMPb+XS2KDShU8OK4t1VhaGEpLrs+kw1
         gBweDN9lhvoWuoiUeWtW0xSXho/7sJjYsghdhmuRoXIM4Xewz7JJ1Ftv4QVEuV9jEiT5
         1fphBNQ4je/uRMhEg6p23lr5XpcrYUI+Ab1w7pQxyTwhlBOpmlxlH5NW3O1XmCyoj9p/
         rlJX6JTfBxfZYcC64wtG65Ie7Qw+doBkgtV0eOSy1z11nwMQWLyklOV8KQonGNEKFsUd
         rbJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaOdPPiVRPVucOTLZH4MZxnaV8H/6LovxfaRfPYe+Oi7paG41NRU6EzTwlC8m2GxGU70BDpZhe7v86r/PpWmRb@vger.kernel.org
X-Gm-Message-State: AFuF++kz2SkPlUVEmgKThyDEPwkHhA6QTBlqqrTjtil6ss/PfAdPon/b
	hj5zyw2W7fFmF3f/59YCNZ8fZSJG/eGnHeNN4iMj7lsW68oOgBDmsduMJwxi+nqz+ihAjEY3VxE
	0u9li1giVhLakJxIC5WX3+I+EdvJk6MI=
X-Gm-Gg: AYBFou1n37NIXg5SRc9psRPmKbM+703Or1X9ti2G0vseMrbKCMM6WCMm3hnMT/hvEIy
	UhlLc2o+3QagZOAyxoR9ZGotSn3OlEP7SfNvkazfGgaAv54C37/9gm8sxAuiejXGGxKSA4cPcAV
	LQBJzud+Jhz805ehFhG9MF0cg0N0RpVx1/XBPd95pw/pGVQYvahTFQyC1ylMdYoj1BM+rSMSd51
	qNL8uxt6v4ny9eThIBgPftze/+0PL0TQEq8jDcDUQwVnnPkLvP72PShJMIW+itKOXgPWHUgIFiF
	34DVgXf3JiELOlcm2al8723W7Qx7HBqr3EXGHUzlSMqgguRtu2YwzQ40Vg==
X-Received: by 2002:a05:690e:138b:b0:66f:c1bc:4034 with SMTP id
 956f58d0204a3-6717fe5cb92mr4558256d50.97.1790045548157; Mon, 21 Sep 2026
 19:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918041321.3532355-1-lgs201920130244@gmail.com> <arFJzYqY_mdeXr4C@quoll>
In-Reply-To: <arFJzYqY_mdeXr4C@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:52:15 +0800
X-Gm-Features: AcwNN1WF2Sc4tKp3txE3ezqyAtiFFXx1O5SoObsCwLYSaLQtB5TSAaZylyQ3I6U
Message-ID: <CANUHTR8c+kVfVWttETsVZtWSaBS6LAEGuipWYNUiHw7==LLfzQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-wcss: remove all subdevices on unbind
To: krzk@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, stable@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Sivaprakash Murugesan <sivaprak@codeaurora.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Govind Singh <govinds@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:14, <krzk@kernel.org> wrote:
>
>
> On Fri, 18 Sep 2026 12:13:21 +0800, Guangshuo Li wrote:
> > q6v5_wcss_probe() registers GLINK, PDM and SSR remoteproc subdevices,
> > and may also register a sysmon subdevice. The probe failure path
> > removes all of these subdevices, but q6v5_wcss_remove() only removes
> > the PDM subdevice.
> >
> > As a result, GLINK, SSR and sysmon resources and registrations can
> > remain after the WCSS driver is removed.
> >
> > Call rproc_del() before tearing down the Qualcomm-specific resources,
> > matching the teardown order used by the other Qualcomm Q6 remoteproc
> > drivers, and remove the GLINK, sysmon and SSR subdevices together with
> > the existing PDM cleanup.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication")
> > Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo
