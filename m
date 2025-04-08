Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240B72356D2
	for <linux-remoteproc@vger.kernel.org>; Tue,  8 Apr 2025 17:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131614; cv=none; b=Ist2/MtTd3cBL6Xa1zDdGelA6zPKrjRvV7lzVv/qZ9x7zD4YUDnZm/R1s2W06lPGwljIh8mgECBpwx3kywZP7GoP0tVFZHvwNLy4Vr18AR3fXzYHENK/X5/uE+LmKWtd9vdzG20/1FC/MtI2x+svFl5KMAplZPTpDpz97PUJYLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131614; c=relaxed/simple;
	bh=SjOuF3EfAG/Cm4uKwVJhwmrygpxq+tAaTnsO4W7wjWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+eGZhxXdAsemOFrLMnT2v/6gvon++2CteSf258rPZpdkxdhr2ZLynl9sDL89BBoNOqB0g1ID9NEN8NN8kJyeCltRmd0s+IJPGcBMXPQv8rUpzU+4AO38senRwnMZma8N1lrgLvyE17TvuYW1POIgNx9plSnTwNVgFcNVSZyMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n+4ZQ5uT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n+4ZQ5uT"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso9011295a12.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Apr 2025 10:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744131610; x=1744736410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lnqPpyCI67o+FtOeQVQFZzGEVChwMTKzHgvwg9jq2HQ=;
        b=n+4ZQ5uTR3sa5ZwcZVt9wiZi0x0jZyjSNj/00ZNMM+pqc1Jl6HIl8XkCEYfwL7Kvts
         lQHSi4MSRWOQUsKgZ56MpJWywfTbgyncSAiBtUh4pu2K+MFTisvbx4AiDRqdY1mbK3DP
         uKzMHS/Se7oPXSSD7qdcL7ZnHngxEDoGjZSxloMqCmuuLFI7RLlEjYT/uDf5rFh52aVa
         9cJQQWyWT6yghn4IT1tLbOYPZO4Ob8ge0v6gjFAlAEj4NZVJgqOBT1Fw1BxtwAOz9aXW
         NrTowdrIKnLmKtXBAD9FWElfpUZNs3vjSrMKPc+ojNcCRqzK94/vtf/Uh5AA6GEpel0O
         lrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131610; x=1744736410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnqPpyCI67o+FtOeQVQFZzGEVChwMTKzHgvwg9jq2HQ=;
        b=Ny4qiEMjvrVHtQT1Dz3VM9dbi/x39PkNx8cK8od3D6NnGpaXmWshTq/pKyjvjqhZgb
         pSKqLGXwt9AI5BJmI3earyjfqbxOvw4qvtG7wz+35NyJZcCeGnsPLrUwHWM6h6H+umEy
         aAELHHC+NNvY4kbf6dNQSGT22rkE3Slu2ofIrRH3B46kkUVG/rHgdmpvqs0NSPcD8LGa
         dg5BIuali1YW+gzm+p3vj2w+UDVO2P4AxjPHKNXjbio7j/Za1arGgDawox1fCRsQwafW
         dfUYv0YuWqo7VjzTGbW0uDMdSHXrZtDzV9dTwX9BavJQrttsuBfvz5/aCWbYe8W/iIeb
         hC1w==
X-Forwarded-Encrypted: i=1; AJvYcCWey/HlFtPm25QCsJBSmmI+BLFvOB8oXM7iOcL0q0Kq0XkRD+AaRLVobQLA+cFHwValTAWRUbWqKTo1hawtSdSl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45EdpiWhraIoNP31fO1V4bPJ1beld405iwsm9q1RPOTUMghSy
	6SFrt6LZgsLsrY80TfMIsRC2qWaTBlHZbpCojxnnw+aeDGmv7QTSJzHMw0YlbwziNh7/Kop1t0/
	iJmwGHrk55L1CEHGA5Gbl6fM+3GO8GPzzSpbK4A==
X-Gm-Gg: ASbGncte2dC3OVQ69zgjhCk7fKUDa3OLBDrAQgx7/RAtFnKezFH6hVCStw+ZrnZbMtr
	ZndRVgyBxPBr9b/9/nOtCejqABARfjwhm99itbzpKV/8k1fCsQFvqCrBFoTTjeLqZ+cTKxs8JLY
	6imyu5hKS9oh1Cy4YNbgqP8ooLg5DpQsZ8n7hCDZMqIQeK/9SKgypf7g2S7v8=
X-Google-Smtp-Source: AGHT+IGekmSfbQuIyvFfz7Stho6MU7GYlFI2lRYDKhjH7rLTkfZA+zKeGtWaeR97sSmOaYBlCFP7b52v5Ds+MX19Al0=
X-Received: by 2002:a05:6402:34c1:b0:5e5:bfab:51f with SMTP id
 4fb4d7f45d1cf-5f0b5c43ba6mr15002775a12.0.1744131609168; Tue, 08 Apr 2025
 10:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-WO-fhDJKyG7hn2@p14s> <20250328045012.GA16723@nxa18884-linux>
 <Z-au0USkvoDYTF7A@p14s> <20250329125629.GA11929@nxa18884-linux>
 <Z-q3ebPSjkSPVlgP@p14s> <20250401014124.GB15525@nxa18884-linux>
 <Z-wOr3eLaX9myqb4@p14s> <20250402014355.GA22575@nxa18884-linux>
 <v5xgigrvpy6shmgdkivmxywkacsubnsimk6vyrue4mmoyufpbk@br7lnyvtnatc>
 <20250403143239.GA22779@nxa18884-linux> <20250408161054.GC31497@nxa18884-linux>
In-Reply-To: <20250408161054.GC31497@nxa18884-linux>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 8 Apr 2025 10:59:58 -0600
X-Gm-Features: ATxdqUFxRkJwgjEdzSDI73SR9AFZYTXSMJ4xjqknUtylbhMnKOBBwweFsaVOm2Y
Message-ID: <CANLsYkyEhhQA5KOsNveGSHUc3ZpckoL-CCHNZ0DZLMNYdNGzdQ@mail.gmail.com>
Subject: Re: [PATCH V2] remoteproc: core: Clear table_sz when rproc_shutdown
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, 
	"open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Apr 2025 at 09:02, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> On Thu, Apr 03, 2025 at 10:32:39PM +0800, Peng Fan wrote:
> >Hi Bjorn,
> >
> >
> >Thanks for replying this thread.
> >
> >On Wed, Apr 02, 2025 at 08:48:58AM -0500, Bjorn Andersson wrote:
> >>On Wed, Apr 02, 2025 at 09:43:55AM +0800, Peng Fan wrote:
> >>> On Tue, Apr 01, 2025 at 10:05:03AM -0600, Mathieu Poirier wrote:
> >>> >On Tue, Apr 01, 2025 at 09:41:24AM +0800, Peng Fan wrote:
> >>...
> >>> >
> >>> >The core is already checking if @loaded_table is valid in rproc_start(), why
> >>> >can't that be used instead of adding yet another check?
> >>>
> >>> Ah. I was thinking clear table_sz in rpoc_shutdown is an easy approach and
> >>> could benifit others in case other platforms meet similar issue in future.
> >>>
> >>
> >>I like the general idea of keeping things clean and avoid leaving stale
> >>data behind.
> >>
> >>But clearing table_sz during stop in order to hide the fact that the
> >>future table_ptr will contain valid data that shouldn't be used, that's
> >>just a bug waiting to show up again in the future.
> >
> >Agree.
> >
> >Do you need me to post a fix for
> >commit efdde3d73ab25ce("remoteproc: core: Clear table_sz when rproc_shutdown")
> >by clearing table_sz in rproc_fw_boot and rproc_detach as did in this v2?
> >
> >To i.MX, the above in-tree patch is ok, so all it fine, and this v2 patch
> >could be dropped.
> >
> >But anyway, if you prefer a follow up fix, please let me know, I
> >could post a patch.
>
> Hi Bjorn, Mathieu,
>
>  I will wait for one more week to see if any concerns or questions.
>  Please raise if you have.
>

I am working with Bjorn to get your patch reverted.  Once that has
happened you can send another patch.

>  If no, I suppose this thread is done and I will start my other work
>  regarding rproc.
>
> Thanks,
> Peng
>
> >
> >Thanks,
> >Peng
> >
> >>
> >>Regards,
> >>Bjorn
> >>
> >
