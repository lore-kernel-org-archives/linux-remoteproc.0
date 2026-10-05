Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018E248881
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791185660; cv=none; b=pKGC4p2Q9gzGIEnJT7UTCo0PiuV+5uqb1d+6JsjkMkzcw9MQ9mZD6reeUerPtI+Q4fuI97L/EMhbdS7IGa7HrjfxqTW7QA389uUeb69C0GJLgeDbcp0jg3pwt8hCqAsTWU6uxyi0yV3oble8D3Cigqj7Ld/DhfDibQi0TJaXCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791185660; c=relaxed/simple;
	bh=ZNgYGUcB/WZ0qm6F4VxoIqTVSqOFyDmEGL1toDXatEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A52kg3giJzVhk5UPRX5CWrYxl6f6i1reNVU0hJ/+XeG9RjR/JXH8+HBN21cNuKExZGQegIgpeaxBQ7lOSaGHIxzhksEEvjkONOlbypWLEjBSVG2gDE8OSD3q/b9q4iox5UgS36dW2VrrolUdQdeThnG9vujBLCScYyVfUxbMAkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qe9tTkSY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qe9tTkSY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso9559055e9.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791185657; x=1791790457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S9lWxLMnIqjYARzXXq5EeOUaizRhex7B8BKafzyau2c=;
        b=Qe9tTkSYXfEFUt0uHr59cGcSJbL/mmffwRViOE8b7sG4ILD9I8IiRyrtw5WakWOl9W
         /SXONiACqf0cC9COPQUd6+Rl2gTSqEEXDJIB7zizeIzr0Yl+nVcDORwyohwCqRkWAtNA
         XefBPjp2ljA8/LeeTIzvSe/+u7OOHfuZ0q1YUI0Fap6/FxBxSle6qBMniZ3VSJBMypO9
         Thbi/fP+2QRx6kW+mNBOUZE3Orjy4GZkolnXFAcp7e2LMEvKwKBwlUBKg9kiAwmaRJGm
         WpVLIkVBLmIaZwVaV7y8bFCcJqucI9qtmA1gUBbeq5YiDT1LTSIAj+KzDhALrQHONdj6
         1jmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791185657; x=1791790457;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S9lWxLMnIqjYARzXXq5EeOUaizRhex7B8BKafzyau2c=;
        b=atwFvuxBigQbkiSDw5SfPN8kJei+rbFoP9IZKhNx2L20gUzQCUKoTEe5LRipzz04iX
         2brSi5TJCvepNEEKpp32TVuFbef1DPUN8qbS7LJXo68ZlCca3TY6FeFLxVloxC6K8X8L
         LI5xk4KXw7/571R6N+jYeS0h/51adVU/ohyolnc7awYaqQ9XOK2lMfn+Jfv32gg0zqVb
         733zxySqBLwXlbjVH0VewoZSoJ1mxug+l7KEEpz6XxXr+l/2XMXyqezu3biCyK2UQex6
         3I1H7sgZjwJxHFClKbgAjVNgiU3GZZtQSFIlEeYYyfHPGt/TEX3OWfdxLq43Imp1Mxi9
         eE0A==
X-Forwarded-Encrypted: i=1; AKwUvBygWOlhhq661403su2+I+aSxg6WU836/o9/iRf9Wkt1aIRDR766YREXO4mn7+PD71KVzPE+CvLU3Yc8qath8zWU@vger.kernel.org
X-Gm-Message-State: AFuF++k+OiwHXaUO7Yt88viJN5NWXZ5ftMn5Y+QZB6Gi6OwOJbObVTm5
	oNU353AggHMR3oFZILFowmZ8fUO7WoRjm2bYl0Pqp5hMUzfwMA1yhp1849Uu/0OhECc=
X-Gm-Gg: AYBFou3iTnheOmyaOE8wWAlbT/Xn4vhlRqEQ4DRlV1G9BsJ2iz9q/9PHaoK3wRol1xh
	3Ok84x3exmyUvXad6mW/JlsLDtatQ2sPNvqZyvTu4cedB3IQJoxqrUZdRVHmH+FDn3oHY6nj3xo
	P0XxdUFR/TXgLzaG3xPwuXkVFNxsMg9g+sstyHjU1j5BtCQQZNGJny/dwOZcez1tfxqHAZwj4CU
	zaQv/WSgi1ueGOxdLjiR7gHvevL+vtYKBNbAWXt23UtGohtXpwBSbJBWsT5y2ujftmeSE3dJj0g
	zYlDTKndGcA1+5c2VNnVh7OdLZwlOiPx97WjAEe0OYnVKK2Qe8covhggvOEXA867ZI1tbHJ83oH
	0xz6Rbb/+4HfhllAjZ1m5yk1c0w7ztJaFA5tMeR6gIYypVLIN19tUPO9U7+SCY0VTN4CGJSjk4r
	2kTxyGx5Xr3eHTD5EeCZU9OJg43RMaR7JsZCx0TzVsNrjBY2tGEba44VhB326ykiXPkDpwTHF60
	QNQXau8Dng=
X-Received: by 2002:a05:600c:3b01:b0:49f:fe7e:dc61 with SMTP id 5b1f17b1804b1-4a02745924bmr160084705e9.0.1791185657092;
        Mon, 05 Oct 2026 00:34:17 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f41:ec49:36a8:7075:6d05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6229e0f5sm2052164f8f.30.2026.10.05.00.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:34:16 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:34:03 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	"Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
Message-ID: <asNS2MeAkLDKM0Lz@linaro.org>
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
 <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
 <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asJwJ6cq8FcA0IID@QCOM-aGQu4IUr3Y>

On Sun, Oct 04, 2026 at 11:26:31PM +0800, Shawn Guo wrote:
> On Thu, Oct 01, 2026 at 10:42:39AM +0200, Konrad Dybcio wrote:
> > On 9/30/26 4:07 AM, Shawn Guo wrote:
> > > Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> > > ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> > > Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> > > Nord ADSP for that purpose.
> > > 
> > > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > > ---
> > 
> > What happens if this patch is absent?
> 
> ADSP never comes up:
> 
>   remoteproc remoteproc0: attaching to adsp
>   remoteproc remoteproc0: can't attach to rproc adsp: -19
> 
> Since XBL no longer boots ADSP, the remote never publishes its SMP2P
> inbound item. The smp2p entry stays unmapped, and irq_get_irqchip_state()
> on fatal_irq returns -ENODEV. qcom_pas_attach() treats that as a hard
> error rather than falling back to a firmware boot.
> 
> Even the existing fallback (ready bit clear -> RPROC_OFFLINE) doesn't
> work: rproc_boot() takes the attach branch, sees the error and returns
> without loading firmware.
> 
> > 
> > When the early_boot path was first introduced I was really hoping
> > that this behavior could be made unconditional and Linux would
> > figure out if the rproc may be active by virtue of it sending
> > back signals or not, unfortunately that hasn't made it into the
> > tree..
> 
> The difficulty is with the positive signal. As Stephan pointed out [1],
> the ready bit is not cleared when the remote is stopped or force-shutdown,
> so a stop followed by rmmod/modprobe of qcom_q6v5_pas makes the driver
> attach to a remote that is not running. Without ping-pong or a PAS query
> for the remote state, I don't think we can reliably say that a remote
> *is* running.
> 
> The negative signal is reliable though. The -ENODEV from
> irq_get_irqchip_state() means the remote has never populated its SMP2P
> entry since cold boot, so it cannot be running. We can fall back to a
> firmware boot in that case. early_boot then becomes a hint that the
> bootloader *may* have started the remote, which matches Nord ADSP:
> it is started by XBL on the Auto variant and by Linux remoteproc on
> the IoT variant.
> 
> I'll drop this patch and send two patches instead:
> 
> - remoteproc: core: continue to the firmware boot path when .attach()
>   leaves the rproc in RPROC_OFFLINE

I don't think you need this change in the remoteproc core. In the
current upstream state - without the ping-pong implementation - the
stop/shutdown/ready detection should remain static during the
initialization of qcom_q6v5_pas. The boot firmware has either started
it, stopped it, or never started it at all. Those signals should not
change state until we take some action.

IMO the proper solution is to move the checks inside qcom_pas_attach()
to the probe function and never mark the remoteproc as RPROC_DETACHED in
the first place if we already know it was not started.

The fatal/crash IRQ checks can probably remain inside qcom_pas_attach(),
I would assume the remoteproc core does not handle the case where a
remoteproc appears immediately in RPROC_CRASHED state.

BTW the issue you are running into was pointed out by Sashiko during the
review of the original patch, see the second comment here:
https://sashiko.dev/#/patchset/20260623-knp-soccp-v7-5-1ec7bb5c9fec%40oss.qualcomm.com?part=5

The first comment from Sashiko about the broken crash handling during
attach could also still be valid. I pointed out the same problem
multiple times during the review process [1]. Unfortunately, Jingyi
never fully addressed it. Eventually, the fixes were moved out into a
separate series [2] and AFAICT abandoned as soon as the main series was
merged with all the open problems. I'm quite frustrated about how the
review process went for this change. :(

The crash handling may have improved a bit with the fixes Bjorn did
recently [3], but someone with access to the hardware for testing should
really go complete the work that should have been done before merging
the original series and test that *all* the error cases are handled
correctly (remoteproc running, not running, crashed).

In other words, if you could also do some more testing for the "crashed"
case while fixing the "not running" case that would be much appreciated!

With the state of LLMs today, all the discussions and my lengthy
comments on the original series are probably perfect as verbatim input
context for an LLM to make it do the dirty work... :-)

Thanks,
Stephan

[1]: https://lore.kernel.org/r/aUsUhX8Km275qonq@linaro.org/
[2]: https://lore.kernel.org/r/20260409-rproc-attach-issue-v1-0-088a1c348e7a@oss.qualcomm.com/
[3]: https://lore.kernel.org/r/20260723-rproc-rmmod-not-crashing-v1-0-546dfd5de0e6@oss.qualcomm.com/
