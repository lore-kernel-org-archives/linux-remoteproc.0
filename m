Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018C49F114
	for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 15:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262045; cv=pass; b=ODkGi3VpnW0aWxiYx71ZaB0HOyFKz7FkQz0ryEJ5nRa5Yuh7rt2VbUWzc8WHOZKNZzQ7M9fL34DZZr1Fz/ValFbtkAlvxI0zaanwAgtiqpJzGjbOOdbxfP8MCXguJNSMtVgLGyTZGHjnNVX4BjVgPpAKZiniLtLqyoil52RCN4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262045; c=relaxed/simple;
	bh=iuUfA02SH2tSSicml2K0I3xqm9pZO7ThoY25b+dKE6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnDJT+bVdTFFw6ztg4a38MoiN7SKcGPn5kJvSNp9eLJ2a9XLM70ntP6/M85KuUkh0ltg4qCw2x6GJCI0qSv62fjRsh8OA5RM366ZtfwhhJjr1Z4AVon2MhCealUNeWtnWwwzokXvcJXRmN9allR+JD6+N1+Z731hjmotK2VSny0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h/tUKF+G; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVDl+InI; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h/tUKF+G";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVDl+InI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790262042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
	b=h/tUKF+GjUa0Y1mVfe+yVQYzqWASfzm5/7k9EnciidAxox34sO54UF/voll/xmfgUGq8aH
	2EuBMW79l/Z623eXVcIWgACtfc3pUpSLhU2X0CCIjiSoAnZNr0R9gBnRC0wKqcY3lHBoz7
	YK/Z34l3bpo15gnKhX3liV6LGOef2uo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Dw51-PiVMgCkKv2MGkuztA-1; Thu, 24 Sep 2026 11:00:40 -0400
X-MC-Unique: Dw51-PiVMgCkKv2MGkuztA-1
X-Mimecast-MFC-AGG-ID: Dw51-PiVMgCkKv2MGkuztA_1790262040
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-87014338e7aso20650457b3.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 24 Sep 2026 08:00:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262040; cv=none;
        d=google.com; s=arc-20260327;
        b=e03Cf6o+YzsfEz7c5qPV5q+wnTsq0E0HtExjdjabqP4FUYxWffHI/6hr6SFEXK/Snn
         xGc9vO4vtmDrU6Fd72K6bi0rHGbSbMJVHpVVb9qR67asaK+5Fg0TSTkyR8YPeXXWFk50
         6yupaHkIgoBdyqlQdyw5QHvdsiiv3tgXzOFGzBqQ/L80klPv5A+B8XUphHC9dJj+WCbo
         EaytDpwQsIO0Vaa8988hclrduvRnn1HRXdgKJWorTB6z7Pfgf/93fOlRVo6/z9ciXedc
         +DA1MOekISbitl47S5kwKpcD/hQB4yMMJr0Xv2ommarkhbvODDs5Qdve11sMgZ0uGduK
         tJOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        fh=3CSfIKz4AE3II4o3wh5tm2ej2axUVyMQWiJTGc1bfvE=;
        b=NUTv3mIwnjiw62N8vjLlvl40sSdI6/41Qqpy2Vifw8zA/h3gN77gSs96Ci1jsWkgC6
         IDwIsC76PQ1yQSiOdtqFr20rMuiLSanXKagqBF4jHWjcwcmnw32Bz4RFWolFwIJbw5MS
         ozSla8PBd50jvoK6M8J+t1+5q18DCzOlxOhOI1QqsWkh2/klD66Awc8kwrSICAlaOl3d
         xeMl92dXEopMKHc3/LV+fEhacbCsa6qpfK7XzaVnm1HD895rleaX5Rpj08p0MWO858yL
         36VQiykPi+rn6qFq4PKHlpVlQvZVRMn6EAt9E0K4LgsgcWVQaQD2cZ1Nh8tBKsn5k64e
         4/+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790262040; x=1790866840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=MVDl+InINlRiSWNoJ+zSo3dPDLpLFAx8rHOQcJPrFcrb0dFjn331QV2IRGTQ7mSLf2
         FzOGnMoq9jW909FTyZADgpBVLgDHXWeUVGIDkPw+aeVry1O2IqecYbQhdHv53moD09Gd
         M6/R10IHRh/oSqPNOZRSalRoelc2p/FUbgk8NWsvk10oj8K0P0i/+6Kb2SJNz7+VGtS3
         EHiUnog1bSJUloT5Ezfcd6Fbhr/4NApXO579lYUqr0j5S8iaQ1FgRSVlUokp15A2kalc
         H92GZLmjxY5Dvm/8H/oqzwnBKNx9aSsXGI80NbQvadYeVqffYhdBjfmMsucgQUH6nslq
         hc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262040; x=1790866840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKTy1DV5Z8HP/0nQigR4wkQdWVD6m+LzXDtQhSwKE3c=;
        b=kgxKG/FwCk9OW3P/y2uTqzYp6eBtdtheUDCOkR2t5IsNA234kJOVWbVib615U+BrzA
         QsvdCO0tgCJ0YNQOC0oxot/H4tbL3N+EFAzLzD4qpLMaV5hocfqmRWv2Z3ciuDnHQT//
         NFdFvavT868ooZrccdB6gmU1QzBvMfNHhPti23ProOxGYGFxdNUrvwLYdhpk0AFR8OkK
         DoFx+BVVKgK04H0PGcFkasUIM7qNmdxSEHJYi0M5HwQYYD0i0dSe4QoYLK32FNxi0SSH
         HaM80KH/ygH3Ni7SrRQ/V0sWP25Hoq+tjs99v11OLU/4V9DHSSLZHKSZhc6ztm1lDHdg
         aHbw==
X-Forwarded-Encrypted: i=1; AKwUvBwd8fBxx+iRbQTGRW4I2P4wwPiIN/x6Skk4NWohzpvwZEeDCFbjzGMFk4BkO4eGkO21AEe8bHh8Ftd25zJCiCfG@vger.kernel.org
X-Gm-Message-State: AFuF++kqxP9IPbKNZnGbXW6ToZITD7FwB4rKfiRfERRD/+PTNFb7J4C0
	HJxa1fivsOisAt/JbfG2QtZVW7rV4rPuALhG220St0o2sfQkjywhuL2CMKQ5ugqlsjk8aEeI/zi
	9PMHf3YtslKc4wuB2u3iniDxCsv1SAbWI/+m+4KGELSn17tNtETz+zWkghpdHszOO/a3NMbO4h4
	Dl2BM1fVIyDyIPAE82XCSASFz0QUCAf/2okHImgY/GMOojtA==
X-Gm-Gg: AYBFou0gjTSeKj+V+T5NHLvs/tZ4nw8RZPu93zAucm4Bmy6MGH4wSiAZNseVxWnYR2G
	/2d+MT072x5dxND6WiHz+EMCfeuEij1T5QYfekrb/9E5SqHEqlN8dL6sqnhuTejCIcjMnTIUr5C
	26lOmBPb1h5hcraG4Ni0CF/r3TN4APp3LRYdTEB7oCG5P/gyt1qImpmA==
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id 00721157ae682-8a64e5d7328mr16132197b3.20.1790262039545;
        Thu, 24 Sep 2026 08:00:39 -0700 (PDT)
X-Received: by 2002:a05:690c:f04:b0:8a4:af43:6941 with SMTP id
 00721157ae682-8a64e5d7328mr16131377b3.20.1790262038827; Thu, 24 Sep 2026
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-scm-device-api-v1-0-3573e2596c51@redhat.com>
 <EKwbCgCnxbNX4p95qJ3xoytzeNBBLc2L_HOVWr-S-y8n7pNOIToj37TyoXRcLyIK1gjq_IvbreQ331gw6jIK9Q==@protonmail.internalid>
 <20260914-scm-device-api-v1-1-3573e2596c51@redhat.com> <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
In-Reply-To: <b1340496-1ff3-4ad7-87c3-36d2162efbfa@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 24 Sep 2026 17:00:27 +0200
X-Gm-Features: AclHuK_S1nrFMWot6v8DC6klfULfaNk07isgmJtfP7BYAekyrR84kzWx2Uw9qhE
Message-ID: <CADSE00JhFYhDV2cuVxZwVTX6LTe8zH0-BR=-Fhv+6UXeFxq_Zw@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: qcom: scm: pass qcom_scm to internal helpers
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

On Wed, Sep 23, 2026 at 11:00=E2=80=AFPM Bryan O'Donoghue <bod@kernel.org> =
wrote:
>
> On 14/09/2026 13:41, Albert Esteve wrote:
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   {
> > -     return __qcom_scm_pas_auth_and_reset(__scm->dev, pas_id);
> > +     struct qcom_scm *scm =3D __scm;
> > +
> > +     return __qcom_scm_pas_auth_and_reset(scm->dev, pas_id);
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>
> Why make this change at all though ?
>
> It takes a pointer to the file static _scm
>
> The reset of the patch looks straight-forward to me but this change
> caught my eye.

Yeah, this change isn't useful. I aimed to avoid passing __scm to
function calls but it does nothing in this patch, it'd be better to
change it directly in the next patch that changes the signature.

BR,
Albert

>
> ---
> bod
>

