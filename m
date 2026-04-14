Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5663939A04F
	for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154418; cv=none; b=l293qBsio34LwdXfLKdyjA+9HSNfT43wsMmRKvLVC4EkV8QW+0nq2Tryn6tyP4W5n2qo5S4fHFilFcQLHQtvYke+Olw/AneazdP/ZskAj6cya/AIN2Iqb0bHUNoQQ+vDDyH4mEU94QfuiGEkKQhK+ZpD4I51QqhHkqyW0GtwV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154418; c=relaxed/simple;
	bh=gT+pzsVIRW212TZcva4L+Ri/0g6hFNVEgkKfdytwY2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M09s1td0GmOiuc8/np7K/PTaP2iRIjO0Z/AwF95yiqc4z1QGC7C+RChF6TT7lrvO2VO7Yz5/+Fnuy4W0SOXQCLKfZ4Z7J8q26YVsK8U54EJWRwQouXyx8zKpw1c5Iq90I33F+bTjbI6dfqOtla5wJEKswRzCRNZOTV66Z/q+E10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvs3SPOU; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvs3SPOU"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d77f6092eso1353106f8f.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Apr 2026 01:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776154416; x=1776759216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoTqL997tPTbH+Ap01GQJYcrt0BpStuqMk4Cw3k+aSQ=;
        b=zvs3SPOUWaJfZaTyoCV5ztGlEjHDSb7rGvmA9wRTfariTS9NPlz4kExcVNvDYIXhC2
         lT0/iL+3PSgFmBkv0tsdzeFAwMWjrXlzFYZ17l0gUQ84Zu1JQrY8BQ/FvnFolMavNjsM
         OW7vT1Z2chOpdbAu8MsQc5qsvPEePtFAtb7F6d15hWfxvFRlGIJG5u5hDKInuy23XeIG
         fmYu2uDTUqcdMmFyhfKmHPQo1iPXE/R+mh0oL6L8ULsiXbZc0QP+223Kpu5xh0GxK/Pr
         Q05Q9plzuxVA4HBbhxYQ9u0u4ZYg7pgZeEYdNH/0Y2iGwqhxQjJ+LQUyYjkYSDgIwLta
         3SEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776154416; x=1776759216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoTqL997tPTbH+Ap01GQJYcrt0BpStuqMk4Cw3k+aSQ=;
        b=sQ/RaLxSCAMBGyH0di9C9hSZI0yOuNircjrm0vnaswt4UVA3dOEl8UvOHtM/YOcWVU
         mr8s7rhams78bU2aIC7f3pDuYBYQ0U2jvxZZgtUReQD/Z2w/de0tW+sRQ1jaAPPX0803
         g36GxZJ36TByOfFHCnip/JQRyeYPM8ELEY87XiST4/upselsnjo9H5191m3QdugQKc4I
         OjyrCZK66l3rG6JrAf4CDvmELQre0CcL+/88cBE9CF0HC2BEHbtJNnHAO1dKupdj2cdM
         ee1YVNnViVniSW3OuqfxlwGRSNDvhlLJYDmuTp2QtEH/u1caTZ4awTjjIxhN1wFvBu0Z
         T5cg==
X-Forwarded-Encrypted: i=1; AFNElJ/E6S6Qmpq44VySFSp8b/gEGogE5LBA3kzidKYNf815KxTjfH2rnTZX68eHMeZ8doCdMbF/XfXHd0+BlBtEuYwV@vger.kernel.org
X-Gm-Message-State: AOJu0YztLfN7ZggP8kyB4r5c9hL9c4yhjDVPO3vlduHHh9KaaIQIoQk3
	1J/SdzeM6GxnMbk5VM3i9PhORuyJ6/YxO19uxGoB3j3fsjOAaEXRSpSGWAOAwdijxF4=
X-Gm-Gg: AeBDievlnwK22hkD7f51s9LDmJ+IwgB4mV3SjeTIrA+2wND7kRrFgYAQnuPsGi3MnCj
	i+90ZUDpomgGgZfBjd0x0GRBMRZa/hCvB//QUNA1y4HVDyIA7wncakrW3XvfrtoY99XmL8iKSsv
	imiMzKFLCl3GroK8IjW+JEj/zMdlTDENDAJM+CEAs7Vu5B8FB3xJoCOdwd0PoWVNSP+yWJbImPU
	RonVl+PWP2nHMZt5uf+nRJm4Pu7uSw1ZyjK9mS+hDMAvWluNI4G3r8sw5JNgYMZ3a4xp1M0K5Ca
	0DmYeM4P7z+BScSKM7FPhLwGYECFInnWjtvWFyXg3AmEyq0QVZifq/Nekx05b7vTOPzFsF85EHN
	fFh2PGdh7efoOZAzByZIrbR5yYf6TugyjTz5auIpGLvz8XaAUywmwwR4i6KG0bEGW9Uo6JVUsT+
	30Z/ZkBU8ltOwHgocHGB8LX99tKBg=
X-Received: by 2002:a05:6000:268a:b0:43d:7403:4b60 with SMTP id ffacd0b85a97d-43d74034c72mr13905007f8f.3.1776154415587;
        Tue, 14 Apr 2026 01:13:35 -0700 (PDT)
Received: from linaro.org ([77.64.147.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm27040970f8f.8.2026.04.14.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 01:13:35 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:13:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] remoteproc: core: Attach rproc asynchronously in
 rproc_add() path
Message-ID: <ad33KwKYBNB6oE5e@linaro.org>
References: <20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com>
 <20260409-rproc-attach-issue-v1-1-088a1c348e7a@oss.qualcomm.com>
 <adkI8Si4ejf6T73T@linaro.org>
 <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <846cf4bb-43da-4d2a-a128-bdaf1371e19b@oss.qualcomm.com>

On Tue, Apr 14, 2026 at 11:41:39AM +0800, Jingyi Wang wrote:
> 
> 
> On 4/10/2026 10:28 PM, Stephan Gerhold wrote:
> > +Cc Bartosz, Dmitry
> > 
> > On Thu, Apr 09, 2026 at 01:46:21AM -0700, Jingyi Wang wrote:
> > > For rproc with state RPROC_DETACHED and auto_boot enabled, the attach
> > > callback will be called in the rproc_add()->rproc_trigger_auto_boot()->
> > > rproc_boot() path, the failure in this path will cause the rproc_add()
> > > fail and the resource release, which will cause issue like rproc recovery
> > > or falling back to firmware load fail. Add attach_work for rproc and call
> > > it asynchronously in rproc_add() path like what rproc_start() do.
> > > 
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >   drivers/remoteproc/remoteproc_core.c | 20 ++++++++++++--------
> > >   include/linux/remoteproc.h           |  1 +
> > >   2 files changed, 13 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index b087ed21858a..f02db1113fae 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -1673,18 +1673,21 @@ static void rproc_auto_boot_callback(const struct firmware *fw, void *context)
> > >   	release_firmware(fw);
> > >   }
> > > +static void rproc_attach_work(struct work_struct *work)
> > > +{
> > > +	struct rproc *rproc = container_of(work, struct rproc, attach_work);
> > > +
> > > +	rproc_boot(rproc);
> > > +}
> > > +
> > >   static int rproc_trigger_auto_boot(struct rproc *rproc)
> > >   {
> > >   	int ret;
> > > -	/*
> > > -	 * Since the remote processor is in a detached state, it has already
> > > -	 * been booted by another entity.  As such there is no point in waiting
> > > -	 * for a firmware image to be loaded, we can simply initiate the process
> > > -	 * of attaching to it immediately.
> > > -	 */
> > > -	if (rproc->state == RPROC_DETACHED)
> > > -		return rproc_boot(rproc);
> > > +	if (rproc->state == RPROC_DETACHED) {
> > > +		schedule_work(&rproc->attach_work);
> > > +		return 0;
> > > +	}
> > 
> > I think the change itself is reasonable to make "auto-attach" behavior
> > consistent with "auto-boot". The commit message is a bit misleading
> > though:
> > 
> >   - You're really doing two separate functional changes here:
> > 
> >     (1) Ignore the return value of rproc_boot() during auto-boot attach,
> >         to keep the remoteproc registered and available in sysfs even if
> >         attaching fails.
> >     (2) Run the rproc_boot() in the background using schedule_work().
> >         [To improve boot performance? To work around some locking issues?]
> > 
> >   - The actual issue you are seeing sounds like a use-after-free in the
> >     remoteproc core error cleanup path. I think this one is still
> >     present, we should really have a call to
> >     cancel_work_sync(&rproc->crash_handler) as Dmitry wrote in the
> >     previous discussion [1].
> > 
> > Thanks,
> > Stephan
> > 
> > [1]: https://lore.kernel.org/all/ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m/
> 
> Hi Stephan,
> 
> Exactly as you say, what this change do is allowing rproc_attach return false.
> It should be okay to keep this change and describe it more clear in commit msg
> in next version?
> 

That's fine for me.

> And the use-after-free issue is what we want to resolve in the patch2
> in this series, I think cancel_work_sync() is a reasonable change
> but it cannot resolve this issue as the worker could be executing when
> we call this(and this is what it behaves when I did local test) and
> the use-after-free issue still exists. Shall we send a separate patch
> for this cancel_work_sync?
> 

cancel_work_sync() should wait until the worker execution has finished.
If you call it before freeing the resources (= deleting the remoteproc),
I would expect it should work as expected.

It makes sense to have separate patches for this, one is about fixing
the use-after-free issue, the other is more about the behavior when the
initial auto-boot fails.

Thanks,
Stephan
