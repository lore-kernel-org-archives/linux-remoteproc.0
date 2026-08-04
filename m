Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1ADA3914FA;
	Tue,  4 Aug 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785857152; cv=none; b=LhaB/lIIb7yLGAjMudNgemE1oAejMnyCToEgL+3vf7lvOiNTJNcCb6gAJv+C3jnbbehcOiLrd9BtB97qo2ZW/QAIZ3ll0Q3JL9x8g/d29wPgElV4p+aAsvNa0auio+FTDFoqEXQdu/FHn2/4DW0L+UUhSyhKS6QizHJr9E1GTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785857152; c=relaxed/simple;
	bh=CYLNbnvT7ghWT8jxl5999erttU6OijUzkgDVnXb+WUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzRVAeWg3puOdZeLkydnBRXrfkaUvGQRyQ/cpCzBz1Cj6liJbds/W8V59Srh5H7mjjcwmSxPybKGKU8iPi/l9USiCnfuzIKnTY5ReEOqMIe2yuUk9oUmZCaLaup75KKTXX1Z8YQWuhisOd5qkvyr0hJG45VJwVcYzZR9CivqE2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebyAwbo3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebyAwbo3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA77A1F000E9;
	Tue,  4 Aug 2026 15:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785857150;
	bh=/s9NThA/sYEI18erFo6p3ldLzRi+2p3xyxPrg8abB4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebyAwbo3SH1t9kF2JQapLEh3BRQBdQs1988APkK8zVcfo6Ma0OBn1Id5I7UfXnKp4
	 Q08mNXjc+Vk85/hZOMNWU/tvjeRTneYlvJamiVwrToZ0WH9hVvz7nY6WjsbTL1vCKm
	 L944JloOt0MHL1fZrI3YT+CeFFCnaXIN0/xh3tbLjgxkQZDC7UT7t1OSKdFCFeQfmn
	 b8ejC/Z7KcGOI5wYSALK5XzA416FBPUnLU48+RJ+Wb8PhHpS/AlK07DwGXLJx00f+x
	 kCFlrVfOfKgsMwr0BRCxoRNtvmn49R/lxnmC7hEi2IEsqXBlSdbRP+k0McQfkHN68f
	 1YPilbdANL1Qg==
Date: Tue, 4 Aug 2026 10:25:46 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Sumit Garg <sumit.garg@oss.qualcomm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <anIEWEkcfFCd5Inc@baldur>
References: <20260724182858.1868271-1-mukesh.ojha@oss.qualcomm.com>
 <20260724182858.1868271-7-mukesh.ojha@oss.qualcomm.com>
 <am7Aj5UdrrtGUHjA@baldur>
 <20260803090645.d5avpt66f2ahoggy@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803090645.d5avpt66f2ahoggy@hu-mojha-hyd.qualcomm.com>

On Mon, Aug 03, 2026 at 02:36:45PM +0530, Mukesh Ojha wrote:
> On Sat, Aug 01, 2026 at 11:08:30PM -0500, Bjorn Andersson wrote:
> > On Fri, Jul 24, 2026 at 11:58:58PM +0530, Mukesh Ojha wrote:
> > > The PAS image initialization path always retains the metadata buffer
> > > when a valid qcom_scm_pas_context is provided, even if the caller does
> > > not require it. This implicit behavior leads to unclear buffer ownership
> > > and forces new users of qcom_mdt_pas_load() to manually release
> > > metadata, which is error‑ prone and incorrect.
> > > 
> > > Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> > > retention explicit.  Metadata buffers are now freed by default and are
> > > only preserved when this flag is set. qcom_q6v5_pas enables this during
> > > probe for contexts that require retained metadata for subsequent PAS
> > > operations, while existing callers continue to work unchanged.
> > > 
> > 
> > I presume given that this was sent together with the remoteproc patches
> > that this can't be merged until those other changes has made it into the
> > tree.
> > 
> > Please confirm if there is an actual dependency here.
> 
> I had an expectation that Sumit's patches would get picked up completely
> somehow, which would avoid me adding the extra variable keep_mdt_buf to the
> temporary data structure qcom_scm_pas_context. That's the only dependency.
> 

How on earth do you expect me to figure that out!?

Regards,
Bjorn

> > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_scm.c       | 18 +++++++++++++++---
> > >  drivers/remoteproc/qcom_q6v5_pas.c     |  3 +++
> > >  include/linux/firmware/qcom/qcom_pas.h |  1 +
> > >  3 files changed, 19 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > > index 16ae42e6c434..54ffec97cc26 100644
> > > --- a/drivers/firmware/qcom/qcom_scm.c
> > > +++ b/drivers/firmware/qcom/qcom_scm.c
> > > @@ -625,7 +625,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
> > >  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
> > >  
> > >  	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
> > > -	if (ret < 0)
> > > +	if (ret < 0 || !ctx->keep_mdt_buf)
> > >  		qcom_tzmem_free(mdata_buf);
> > >  	else
> > >  		ctx->ptr = mdata_buf;
> > > @@ -664,9 +664,21 @@ static int qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
> > >  	memcpy(mdata_buf, metadata, size);
> > >  
> > >  	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> > > -	if (ret < 0 || !ctx) {
> > > +
> > > +	/*
> > > +	 * Some clients still pass the PAS context as NULL. Until all clients
> > > +	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
> > > +	 * for NULL before dereferencing it.
> > 
> > Why don't we fix the problematic clients? There's no point in working
> > around such things.
> 
> Was waiting for Sumit's patches to land so that I could convert
> every client to use PAS ctx.
> 
> > 
> > > +	 *
> > > +	 * When a valid context is provided, keep_mdt_buf controls whether the
> > > +	 * metadata buffer is retained after PAS_INIT. PAS remoteproc subsystems
> > > +	 * set this flag so metadata persists until auth_and_reset() completes,
> > > +	 * as TrustZone keeps the buffers locked until then. Other callers leave
> > > +	 * it unset and metadata is freed immediately after the PAS_INIT call.
> > 
> > Please rewrite this to make it more succinct. It seems you could say the
> > same thing with just the words "free the metadata on error or if client
> > didn't request us to keep it".
> 
> Sure.
> 
> -- 
> -Mukesh Ojha
