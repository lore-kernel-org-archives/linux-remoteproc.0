Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB918FC70
	for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729242218; cv=none; b=lZMFp++W2tSId8pc3oeBV8jo9GiuQ8o/4N2G/TSHWdKHyPb3t55Rk6kbnGsQeSpofyQ132JiFtgn1ijU3lo9AB2F0WJFYd6nG/FeKhr4N3oPA5QnCkkYdNb9rj6wHwfGIOfEeXLVeIlSFQGDAXBPZukXuLpg9SmDFdqAzAW+Moc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729242218; c=relaxed/simple;
	bh=MAuK9ZpjaW//o3+/lqn2ofD4D+7bWlq6mbU3DdRjkEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbfK6meIV19j+05cY04w/67V9j9WKBWLBkdGPO/qDtNe73jCf+d7uF0GD3mWdnHA0W7A1+of+ibIsOgJtAi+ay4QjbT9mFmxv9itYCEE52lXh+/0lTL0uYEsqA5U5jktWrDnRSHmpnPJ0kxLiJRaxRC4wPigrohq+tu3t6UIRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0RsXq22; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0RsXq22"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e297cc4b134so1864881276.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 18 Oct 2024 02:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729242215; x=1729847015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9pfIMsORbWEsl/vnzFg7G1qoNU1sMiSopJc4WsDjiQ=;
        b=j0RsXq222A7yum92BGgzlKcK5m5nNJKzoGCAr0MsCjn92PwYGV5XDyPyB8U5lvxj0J
         AXaPA7HAmof/33PqmSboRUyCJAAT3ocDUImuEhjjEg8Pd3m5w0/p8gVxMPvV7LbPCzVf
         Jja5fuuTEKPCTkSZDmbFZcrusxKHe+GpSC4H9gaU9jJmneDVreYiurGGralnzlq9xdgo
         tisgsiq7UBVMTL304T7cNnZMIfvuUuOjsG/78rNv2Bnz0JE9CXFY6PRkZ01PigMN+F3Z
         5hOfTs3H75dnbGVZgQv8fFoUf3seL71t8KeB5b+wQQKYRJt3pv6gFPQ+cGTdbu985wWl
         kg4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242215; x=1729847015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9pfIMsORbWEsl/vnzFg7G1qoNU1sMiSopJc4WsDjiQ=;
        b=WHaec5934cGfsRyddKjS9MSal39Q9WkTCHdCTCduVVXJd7v+LIGifu3jEWN0nVBHkh
         51ezji3NzbnHQ1Mq4OD1sYVBZiOTmXmk9a9B4915qFY3QMmMlg3N5ZlarjHA2Vl+z7O6
         uQqCyKkBWV06Gs9WdhAX5K29zfgpXY2froeZoEMeXTgJSW3sjW1s32gl4/tCYHfbGW9w
         jKPjvwa1bTiY7eSlckRHQcTyEArzf+xcGJV1kzfJnMenQJdfwWqjpcNjrbcYteWvDoxq
         p2xLx25a1nt5ESaI7S8oXhwJRw+ovBizh7hQ1pIvtzr8IDJNQf08bIkCR6h6VS5ESBq6
         ZSAg==
X-Forwarded-Encrypted: i=1; AJvYcCXzUw39j7nybiE80Uu64AkYu4ZwYe6Quz52A7jyxtZWdb1X7c3OMIkdKKRd9Vn4PK/iBYNQ/RUh/cuaYd8LJq/T@vger.kernel.org
X-Gm-Message-State: AOJu0YwInIkvtBB6rD45bzbDRRA4fTTveIaSVJ96XnP1yVAyVvujUAKD
	9NfT73fqKCxtXx12GOL3rEwHBDRa8Tt+iQkXeIFT+dQNt9Tkd944RFDS/ziVk3Yh31raVuUlP+A
	bW6+CW0bR74skhSJxUmnIRLRyrhF+ClBHd/wjdwm8HKWswYnOb6s=
X-Google-Smtp-Source: AGHT+IEIdqLJnXhR9eBPZC+aIkQ6YsTEogGzB+/bb0aWbntjO40LQ3cW1sY0LwG4AT1TVSM2B1Norwd2BmiIa/TTqSI=
X-Received: by 2002:a05:690c:9a0d:b0:6e3:28af:730d with SMTP id
 00721157ae682-6e5bfc611efmr17451427b3.43.1729242213908; Fri, 18 Oct 2024
 02:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016135409.2494140-1-quic_bpothuno@quicinc.com>
 <mvzwlbeopenn5hpll3rmkdwcc7r7ir263nwvlh2hiy73qeipl6@nh4angyrt5p2> <LV8PR02MB102398337D13C6E0160E0FD14E7402@LV8PR02MB10239.namprd02.prod.outlook.com>
In-Reply-To: <LV8PR02MB102398337D13C6E0160E0FD14E7402@LV8PR02MB10239.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 12:03:22 +0300
Message-ID: <CAA8EJpqJgxPErHkce8avfZUkU1D9rEiWTDQqJhUe_nm6n_PODg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
To: "Balaji Pothunoori (QUIC)" <quic_bpothuno@quicinc.com>
Cc: "andersson@kernel.org" <andersson@kernel.org>, 
	"mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Oct 2024 at 11:42, Balaji Pothunoori (QUIC)
<quic_bpothuno@quicinc.com> wrote:
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Friday, October 18, 2024 3:59 AM
> > To: Balaji Pothunoori (QUIC) <quic_bpothuno@quicinc.com>
> > Cc: andersson@kernel.org; mathieu.poirier@linaro.org; linux-arm-
> > msm@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> > kernel@vger.kernel.org; ath11k@lists.infradead.org; Kalle Valo
> > <kvalo@kernel.org>
> > Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: disable auto boot for wpss
> >
> > On Wed, Oct 16, 2024 at 07:24:09PM +0530, Balaji Pothunoori wrote:
> > > auto_boot flag ensures to take the firmware and boots it up during the
> > > wpss remoteproc start.
> > > wpss host driver would like to control the load and unload of the
> > > firmware during the load and unload of the driver.
> > > Hence, disable the "auto boot" for wpss.
> >
> > Which driver?
> ath11k_ahb.ko
>
> What is the reason for manual control?
> > The board seems to function properly with the ath11k driver, which doesn't
> > seem to require manual control.
> >
> The rproc "atomic_t power" variable is incremented during:
> a. WPSS rproc auto boot.
> b. AHB power on for ath11k.
>
> During AHB power off (rmmod ath11k_ahb.ko), rproc_shutdown fails to unload the WPSS firmware because the rproc->power value is '2', causing the atomic_dec_and_test(&rproc->power) condition to fail.
> Consequently, during AHB power on (insmod ath11k_ahb.ko), QMI_WLANFW_HOST_CAP_REQ_V01 fails due to the host and firmware QMI states being out of sync.

Please move these details to the commit message and add Fixes/cc:stable tags.

>
> Therefore, this change disables rproc auto boot for WPSS.
> > >
> > > Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> > > ---
> > > Cc: ath11k@lists.infradead.org
> > > Cc: Kalle Valo <kvalo@kernel.org>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c
> > > b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index ef82835e98a4..05963d7924df 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -1344,7 +1344,7 @@ static const struct adsp_data
> > sc7280_wpss_resource = {
> > >     .crash_reason_smem = 626,
> > >     .firmware_name = "wpss.mdt",
> > >     .pas_id = 6,
> > > -   .auto_boot = true,
> > > +   .auto_boot = false,
> > >     .proxy_pd_names = (char*[]){
> > >             "cx",
> > >             "mx",
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry
>
> Regards,
> Balaji.



-- 
With best wishes
Dmitry
