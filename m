Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149B283C97
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 May 2025 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665431; cv=none; b=I0L3jJ/lKeFIyW7k6sC4JCr405x0wK5UMAo3W3UbGH2t1SwIc8ivdwX27xss5uW/Izwf/3KfmD+wlcDPBUo606OEIC0c73XGUMPdOHnMu+SkBolXV9Ge2+9rLRmoksZvTdmxBBom9sn32f6VK79d8vSmOqOGoUOua2jPaM3qIjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665431; c=relaxed/simple;
	bh=5/V2tABvYgLP5UNbooAOeTQyZUJ+sJi2zBNmH3pYgAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWCmy+ENL/sWkZ4jfSjBo/GCUoRP6ITFJ/7SDNPCFYPOAp9drI5QjM6U3jl36rdqS+CIRDS4Y2Rons8RPOsE+11obCZW9A+kNmGWhtWVfX1Ks10mA2j69Gr+GKXC/ausUoRuHl1cYF+rtdMp/Ne5/0++6X3SO+yL3nNRmxTGnI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QdGBriuI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QdGBriuI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23274dbcbc2so1003645ad.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 May 2025 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665429; x=1748270229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1vPXUaqLnASCk26v8AYq/xyh0dL2NbOqMP5+RZIYdN8=;
        b=QdGBriuInvPdBnyzr2DPbyoWOTtWYDtX1FcQ1z2g8cil9eLmph2m4QzB4YWRifqdwr
         uJIn5tZj/UWY96Rq9QlVL8avkczXw7/8bhl33KsH1/aK3LrxxRahlxfBC5VLDUhWqyua
         FkmhAMorI8jsHjK8BD+AABceE0iGaWIWXGe39ktpka4xAO/4+HpM7MkABnzeg/HBJ/E2
         Tlr/DRR8iVuuSW9iFzfxNQZLosqES50CetSHSUaWm9oZ+7NnAgmgZjeuWjmBrVrt/gvZ
         /GgaeHCTF7GIesKmBairoLgUx/12TxTPjz25Sfwp0WCXm4bBCvEaRiemFYEj9t/uPzMM
         1vcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665429; x=1748270229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vPXUaqLnASCk26v8AYq/xyh0dL2NbOqMP5+RZIYdN8=;
        b=R19WA/d3ahTnmGgOjzk+Gijr0djGj+alAmy5li0peHa8k7DUdMot1NJdyjgU0PoRdW
         3JZhPuqr/Kp0LYeRtlai4J7FbR+G+E3uBD/AnRARHsz1bkd3kG0x83idQbGrART9eXmW
         tHoVO0B8LMSa5yDObbjVgZG2GRHy2aSi0Oxe/67ABwmN1I3NE0ghhlzq0/61jWdbn4yV
         H4C0IK4owuwdeHuoecniMJswqfHYqpNKynKd7CDIgQtaXJ1RxL3DJIBNMiA+OsVRUNgx
         gy3b9uAPB6GwDEXC5B7TDTec5pzvqcwPvd/ZHjrWLBYYgU5DIZ0E6hxOKXveE0ZSHDs+
         BvYA==
X-Forwarded-Encrypted: i=1; AJvYcCWmyO/kBoy3C7/wr6KEan7LWQqDU/dyau/FnWWK/KoDx9tsEMRG9PMOHkiN9+OlFE6p+7ZGeIMlIcb/pjoPOUdC@vger.kernel.org
X-Gm-Message-State: AOJu0YzkRmxs95v9Zrn6ZCX5b7a6YT6CRPaA/wh4mGXdHHuNLovbez4j
	vBvxtnr/VttDmaPuhZUUjSP2KMhYoI6i5k6MbHr4dIqVEPbxoCY03te/2yZlyIIBj78=
X-Gm-Gg: ASbGncu1zTFjEKhJ6Q3Qp+x2uHQb5ewLmtAQESJ3kJi2Ey34US17oRMLwot33NFSVrs
	l+Eoz65DyE7yDbzFAPDTmNy2SDK4+8iiJduZmUkUe6ERyuXmdFfLp1oH6/rjP4aaXgF1Ut/kq3P
	A6xPfYOQEAvsyiKoiYZ+PV7elDcmvYXNwu9Rn0Ds5jq6URpwuwBT5095XpMFA9k0ivieiIFDc+n
	ICCstjRowHGZ3hBkICjYkHhgmTzOaMKLILKompmR+pYTcpIl1+gHemTmCfuHLF7ich20PmnkfN8
	IKa6ih7nsDkRVoMnXy2JKCEPOlsY3RaWD7vorDnft2uNeskj6Q6GxrM=
X-Google-Smtp-Source: AGHT+IF/y9xxWUyxf7UmJBXjeSXfMuDpXpZ/CMmnWi60Hs/4WXDf6kx+HvnkJigPJrS3fZ5zy6fEPw==
X-Received: by 2002:a17:902:db07:b0:22f:bf03:8dac with SMTP id d9443c01a7336-231de375428mr166495295ad.26.1747665429289;
        Mon, 19 May 2025 07:37:09 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:196b:a5e3:3e1c:c6bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4af9f65sm60755855ad.87.2025.05.19.07.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:37:08 -0700 (PDT)
Date: Mon, 19 May 2025 08:37:06 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, afd@ti.com, hnagalla@ti.com, u-kumar1@ti.com,
	jm@ti.com, jan.kiszka@siemens.com, christophe.jaillet@wanadoo.fr,
	jkangas@redhat.com, eballetbo@redhat.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	martyn.welch@collabora.com
Subject: Re: [PATCH v12 04/36] remoteproc: k3-m4: Don't assert reset in
 detach routine
Message-ID: <aCtCEvGlqIIDYtcn@p14s>
References: <20250513054510.3439842-1-b-padhi@ti.com>
 <20250513054510.3439842-5-b-padhi@ti.com>
 <aCddoCUIpIV1ZxEW@p14s>
 <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <057cffb6-3ff6-4795-8501-7695d7ebc6fa@ti.com>

On Sat, May 17, 2025 at 06:53:29PM +0530, Beleswar Prasad Padhi wrote:
> 
> On 5/16/2025 9:15 PM, Mathieu Poirier wrote:
> > On Tue, May 13, 2025 at 11:14:38AM +0530, Beleswar Padhi wrote:
> > > The rproc_detach() function invokes __rproc_detach() before
> > > rproc_unprepare_device(). The __rproc_detach() function sets the
> > > rproc->state to "RPROC_DETACHED".
> > > 
> > > However, the TI K3 M4 driver erroneously looks for "RPROC_ATTACHED"
> > > state in its .unprepare ops to identify IPC-only mode; which leads to
> > > resetting the rproc in detach routine.
> > > 
> > > Therefore, correct the IPC-only mode detection logic to look for
> > > "RPROC_DETACHED" in k3_m4_rproc_unprepare() function.
> > > 
> > This driver has been upstream for 9 whole months, it is hard for me to believe
> > this but was just noticed.  Martyn from Collabora should be CC'ed on this, and I
> > will also need the required R-b/T-b tags.
> 
> 
> Cc: Martyn Welch martyn.welch@collabora.com
> 
> Requesting Andrew/Judith for review and test too.
> 
> > 
> > Typically bug fixes are not part of refactoring exercises.
> 
> 
> Typically, yes. But the refactor depends on this fix. This
> k3_m4_rproc_unprepare() function is entirely refactored to common driver in
> [PATCH v12 26/36].
>
> So, If the refactor is picked without this patch fix, the mainline M4 driver
> would be fixed, but the older stable kernels would always have this bug. Let
> me know what you think.
> 

I suggest you send this patch on its own and then the series (without this
patch) with a note in the cover letter that it depends on the fix.  That way we
get the best of both worlds.

> Thanks,
> Beleswar
> 
> >   I suggest to apply
> > this set without this patch - you can then work on fixing this bug.
> > 
> > Thanks,
> > Mathieu
> > 
> > > Fixes: ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F subsystem")
> > > Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> > > ---
> > > v12: Changelog:
> > > 1. New patch. Fixup a state detection logic.
> > > 
> > >   drivers/remoteproc/ti_k3_m4_remoteproc.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/remoteproc/ti_k3_m4_remoteproc.c b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > index a16fb165fcedd..6cd50b16a8e82 100644
> > > --- a/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > +++ b/drivers/remoteproc/ti_k3_m4_remoteproc.c
> > > @@ -228,7 +228,7 @@ static int k3_m4_rproc_unprepare(struct rproc *rproc)
> > >   	int ret;
> > >   	/* If the core is going to be detached do not assert the module reset */
> > > -	if (rproc->state == RPROC_ATTACHED)
> > > +	if (rproc->state == RPROC_DETACHED)
> > >   		return 0;
> > >   	ret = kproc->ti_sci->ops.dev_ops.put_device(kproc->ti_sci,
> > > -- 
> > > 2.34.1
> > > 
