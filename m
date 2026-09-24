Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BA64A2A62
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264544; cv=pass; b=sEgdskM6mUeQ+TkDKke2P2pu1mp7qgKeTS6GyRaPMPP9HnqFZgrUDni7kL2xlWABpVQeFHPNzpCdXp4EaoEjcUI/k4wnMnP7zz/UU8pkYtxUZHl0Isf28qt6mYPGn4M8CYFdXTnPC+nu0UzEsXbsw7A7gxr1NE9nAmjC7ZBTn5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264544; c=relaxed/simple;
	bh=PyIrnipvkBWRV4hHOpoG3qPK65aPl0bzHYIyrKbgTzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zji3/6zSns/Z1uG+1SGH3hQR3DY9JuB+7A6CwZHmuy2Do2b3b/SbOaudZ2M0VnUWDc1cR/xoLsWYSjMM1g97PC7at6QuJAImNesQLJJKx7e8ydEdJjaa6NOG7V1Cm+WJjviTg60WJptQNDRNkB3qQxKkuTZe71iddBY4hNBWjuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5nJqjG+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UiSN36fQ; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5nJqjG+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UiSN36fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790264541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
	b=N5nJqjG+CCqiKOUMIy+cAq9Ow0QOH/g8y7qkqripLHY+xA52Ulvj6QjC4UgfhNAE8f/NTQ
	ERP4l6jY5/34bDLO8j/YOXLeTbisjpqVsIkISSyPKLuKvnUmIF7dbd50s+oyMss6RvkYIO
	Gvg68S8FqYiBPUh24USVfCB6mx3/9Ew=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-_oC3t3SnMgyuwGUaYaAydA-1; Thu, 24 Sep 2026 11:42:19 -0400
X-MC-Unique: _oC3t3SnMgyuwGUaYaAydA-1
X-Mimecast-MFC-AGG-ID: _oC3t3SnMgyuwGUaYaAydA_1790264539
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-892be308686so41800737b3.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 08:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790264539; cv=none;
        d=google.com; s=arc-20260327;
        b=VE/ePFQErec7oR7q60zWGNpqKvS2mtW/t09JBEj0DZYMceHK3/UpCeD/1EdT2sGL6n
         FgBE4x+wGyV3i+RJ9ZhvmwJ0H9zKil/8+BHXwGUJXkfDAQkHETz2XZSdGWr2KSakKiUv
         5Jf1yGUQx37LBH6BZF7/K2K9y4Ixo/3Rum9a19+h3Ogz0XOs0ZqPiw9qAcFeYlETYJWF
         DdhwaWNoHxGCX9ojlAr2jYtjfpByWB5TxZ1yj5P4QSHvSCJy6uPdvtDsSEN28N9DkUpo
         tjPcjyjfr57u0S1DvS3qf2nIq3yOLOYeYQWKKGOMOVuCMnjjobwWKV7JT7CSWI5RvSNL
         DCag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        fh=WDWqmwbRNNMRRFSMO1mbHcX/wM8HTqw9mC9RBvLzBeM=;
        b=WUR/47STxzoro0QJMGhnkkdrI8TapU/n8FKeNqEOrf648BIAZJ7185o9MmQ12+Nvm8
         awFDLq/gnoAVBlcLpCQtrElSXnBihm26d0My6KKbzGdwPzEmvOe+VJPHYFc4HRvjxXR3
         5UOQHqo0GnWpHzRtEFnKBd8bsnWsJEjSeXk0lFVEQfOqbMFIPeyFcPlLeqEzYMHL4Y1T
         0xA0S1zqz91UPZbjI+PaIROd+j7j6hc2ddpkSQxxIwSTKO6oj99T+OXNzVFCfvJHGbn9
         jVpTCz6NAw5krPvrbosaEuRp7tn2KP2E/YX1Rypou/J+4H5Pzq3UV8N+EAb1TaF0dArX
         U9Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790264539; x=1790869339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=UiSN36fQL6QI7gOFKIRAXpB32KZvpgTZ0bYV/KBNmlIN6qm7jax60KwKrEHg+eMqa9
         udWcnbLBthounfjlspUNpVzA/a3M/L6qNzbO4BzIhnzqgD6x4PLAtrz7dbs16BVvHAlv
         kRf0aJ8GyBaHFCXd5a/GnXw3AuBUbbSzs4kH5Omcg1UxWjIYTVTLXFzBfq911Hg0J1v4
         jdF3NvIiJCHTWsgehT5JMOrPtI/KTgdCt2uGvHlNfNm1ZXHO0vFWZ9SJQXMWytDuNWZh
         54MEXb0EiRLNWgTC8Fbnwm5byWnbinwmAgKv+DglBTsNlbOPHxpIWgvG4r8ffXv1kwBs
         rFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264539; x=1790869339;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/64YUvNMf9EIe8aZXp3DzyY+LbONkg5uQf4LZYgGwC0=;
        b=0tjZTK0m6/Edorm1oOTJF7H5/etMBCsVNAHGQC1k+RslIQ4mQFBS08UfK5pI1e4npP
         FLkG8UIqQR+PTrg6IJgCsuCw2A+0D3XGPXktPpCc8y9YXilpvruHYtAAfqAOBYNikeft
         kXIOIPK2isXlCeY+sARFPji+5wrL1a+YCTBj6pmQzNMwXHTQyDPkon2sNVvwk4xgn6KL
         Zo4J81WS81o7I6scIMDUFAxqjK0Gpc5ui5/vjQwhdzbf/3GHBKAUlGAHu2LQbdCI6kXm
         8hyEeIPp4+x5rGtHZds6jwpi2TQ6x2sduLl1jqZv+7cnQVJPXtymu2g9zz5x7M/5IJPT
         KHtA==
X-Forwarded-Encrypted: i=1; AKwUvBzKDQk6eD3Yg4kqiUU+HUD91UTIdDfsDo1naGBgwWBvtrPnX4/Y7tRnhbYqiQFB9QTTEOrHd/QT8rjaw0+Ju7/l@vger.kernel.org
X-Gm-Message-State: AFuF++n1nw2a4ETdXUDO6k1Z/uUJtlj6vVU0vYJNncyMAHFomKGnMKeV
	QcpUDrYf32U7K5z+DAtbDcfWWDyfNOxHNeYfWxWQ1ro7eJ7W9+WUH8Gi4cfrnrHmYYZQRQdCB2H
	vq1rBm0G0Ug5s2uLTtyVqneoaBm0MzpXLkI0ZVbeYP/INCkHWFYXHOIIh9eYsKhlt9BNJuAzem+
	nPKSm4uZDIJrfiRbw6MZPQcLx7kiwn9fbPH9YZ3mz7au5Gzw==
X-Gm-Gg: AYBFou34C/vxUpRtJAQTzFVROpaiXQh/zQZ2zRT5sLtiNBcHA16ROQRlp5QC0Hreo2p
	QEotgxxZwuC6IRrbMec0sklRlGQD9Dl1ZvGicx2inui9hVLCI6Sk9Id7KrMcyKvwzdDk7A5ftmQ
	jjyICA/B4Rz+AqaQs9QBlALLKwRoz75CLkJ/XnUiLxckt6QDZOzfQUWQ==
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id 00721157ae682-8a791f82a3bmr9357287b3.53.1790264538829;
        Thu, 24 Sep 2026 08:42:18 -0700 (PDT)
X-Received: by 2002:a05:690c:6e87:b0:8a7:91f8:1e8d with SMTP id
 00721157ae682-8a791f82a3bmr9357067b3.53.1790264538368; Thu, 24 Sep 2026
 08:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <bRb6NzJiFvNGB0X3BeiVytgZNlRv88LFlcaBwwFIFa3GtVZhn5bh9EoRRDliRtgsnlQNMddvcIPK-5HK9x7z9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-2-3573e2596c51@redhat.com> <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
In-Reply-To: <49153dff-b4e0-43ac-aa82-15175fea6445@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:42:05 +0200
X-Gm-Features: AclHuK8NibWpN40MLtS8tk1TsaU8ZJKSI8cLr02zuHOUyaXDRMTCkw3xFezOa38
Message-ID: <CADSE00JcFOY0r6doD1Qpc0xtZ6HKsa4kFGsV0_FsNbb+yemmKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] firmware: qcom: scm: pass qcom_scm through the
 exported API
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>, Jens Wiklander <jenswi@kernel.org>, 
	Sumit Garg <sumit.garg@kernel.org>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Brian Norris <briannorris@chromium.org>, 
	Govind Singh <govinds@codeaurora.org>, Niklas Cassel <niklas.cassel@linaro.org>, 
	Kalle Valo <kvalo@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, iommu@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 11:08=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   static int spm_cpuidle_drv_probe(struct platform_device *pdev)
> >   {
> > +     struct qcom_scm *scm =3D qcom_scm_get();
> >       int cpu, ret;
> >
> > -     if (!qcom_scm_is_available())
> > +     if (!scm)
> >               return -EPROBE_DEFER;
>
> Is this equivalent code ?
>
> Its also a bit confusing to me that the next patch adds a .available
> field to the qcom_scm struct.

I can see how this can be confusing. The problem with
qcom_scm_is_available(scm) is that callers did not have an SCM handle
yet. So drivers needed to search for it beforehand. Once I had to
repeat that a few times, I instead added qcom_scm_get(), which looks
up the bound instance and returns NULL if it is not ready (and still
uses qcom_scm_is_available() internally). So, !scm is the same check
as before, while we obtain the pointer for the following calls.

scm->available in the following patch replaces the __scm publication
flag when the global is removed. Until then, readiness is still based
on the static __scm validity.

>
> I see where you do get drvdata but I haven't managed to find in the
> series where the data gets set - haven't asked an LLM either - I think
> the logic to associate the scm pointer and get it should live together
> in one patch so that the logic is easier to find and reason about.

platform_set_drvdata() is already in qcom_scm_probe(); this series
only adds the dev_get_drvdata() / qcom_scm_get() lookups. I can
clarify this in the commit message so the set/get pairing is more
obvious.

BR,
Albert

>
> ---
> bod
>

