Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D01EF084;
	Wed, 30 Oct 2024 14:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730297058; cv=none; b=Lmnalz8F3Z499vqH4G++a+3ptlDFFGay2ixtG4dyi2KRcWq54dqQr62OzHNyOPpK9JL7um20iC7V6USHfm50r8tbYGRaXw2QZGfRd5j/LNlsoVvbM5UolIIVj1aUz/hKsEfryZ5oZxYxRWwiUodEHP6IL/UeBn0T3vOk7kwziG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730297058; c=relaxed/simple;
	bh=riTO+YkAY0deqoxQOS9+RgcWTfT9chRhKEWcM4sn+IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGuwClAY5xQIYcxr0CalFNUBNVqO4yv0UxhQbssRun9U1AKw3lg958WuK32o08iouG7vNJp8F9jNOyVDfP8rzqxfXsPz562jYOsHKxHjUYuZSyg6j1r4yrDN9fLlqaw3u2Va0K28jZatfBFU2pOx4E0vbTheP54vJEOHQGOGhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPKyIVSJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPKyIVSJ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb58980711so59678201fa.0;
        Wed, 30 Oct 2024 07:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730297054; x=1730901854; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2PgkGCB9uEgJ6DAJj1+SbB2BSpBIqMTAwux+rvPO10=;
        b=QPKyIVSJ3EGUMFqC4w5z6rXoIzJ5i6jwtOTm80EOUHBtFM/BWv2LcJPTWEwQVa4vGh
         tCg2Jeqp2bo/TBilSaJzU6oIKe3W+IsszCEeyTv3dIKzrPA7HsxqaUSLkP7V/Q5WqE3P
         MM7ZHpvaixfFiby+ogYaopyYHpYEnaMBjFAYy7oFzM4Cu4GpibMfZwjcOv+IPz5HAdd5
         MCApVWEqNPjV56KEcBnv1ZDOwl4UyAdoPBuEvxq6QI7vAMnMIK5NEmU/NnMRPptvVFLr
         BcbBYnlUwALsRh+FQiOFsvptZG76h9qLcXMg4dsZCfNBRAbkC/BQO7U+cG0qQVLUWxgR
         8Clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730297054; x=1730901854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2PgkGCB9uEgJ6DAJj1+SbB2BSpBIqMTAwux+rvPO10=;
        b=i1sZiy6545RvcZZ34ZJ8xHbsu3u1hF4XDfEjh+6cFMOzOKHj1KXxLBrENFp9ZnCPa+
         lKnU6k5e/Ab33OEtVPpNzx4OeWS9MkcmlqxD0IFhkI+TUdMx30RwvGOdKlztwsZygWSG
         k892heB/+zlcBMKNsKd3AxvG45TpzhvHXlLxTj/9hSph22cGs+gFn9wL2//X5R9eVuII
         uB79/8vYYygPAxhV7hUE21kLWZA7O2VcL77gPz2+WtDlrT2Q5ioGmcExaDKSz3HxV+qb
         658X4g3obg919/ao9RqOkiclgro18mCjuxBFvpj/iA0mIjUg3/OocmgRMAjapYPa1mMo
         ySlA==
X-Forwarded-Encrypted: i=1; AJvYcCV3KvwaAb1cMDicjrW0EyI5nYTpOYY4JZQr8Fce64zpS6ncEzpuNOZBr5+/CF2duxtvwMG2Wb5/TehWxktBeeu4WA==@vger.kernel.org, AJvYcCWN7NBcXT5MatyQyYhpFGUVzNvJ4b78qncnDeq5/qYQkt7zGlG1AAskG5V6/O9967MH2Zm6v7jBIAu95mM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEwzncS2NJqO8M9bk1rNeVtqLvLdZtvEz2MK0o39jjVh0QsVOc
	SV6k2P3FGKKXqsG37Y4uRKNbakr4NNvNwX/kurTfW41f0U6w2J/AF0ksTbbw/HgP/lpG/acs0sR
	oxqQSUIvz5NK4442Ro0X+38MrLN0=
X-Google-Smtp-Source: AGHT+IHnJq84m7aUxfG0ZPJwIferNLUtsSal4frhbPzaGkjLOl9PTdIGNUzgO6W6eHSANhGUNLyySnRg5jEKCK/i8WE=
X-Received: by 2002:a2e:a99d:0:b0:2fc:9759:4e20 with SMTP id
 38308e7fff4ca-2fcbdf70d46mr76674701fa.12.1730297053313; Wed, 30 Oct 2024
 07:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018110929.1646410-1-daniel.baluta@nxp.com> <ZxkW9SUr91PyH9c/@p14s>
In-Reply-To: <ZxkW9SUr91PyH9c/@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 30 Oct 2024 16:04:00 +0200
Message-ID: <CAEnQRZDoYvK-YXLjqbXsRAWDkHrWNOoR1OCCWxs+AfNUDuPB_w@mail.gmail.com>
Subject: Re: [RFC PATCH] remoteproc: core: Add support for predefined notifyids
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, iuliana.prodan@nxp.com, peng.fan@nxp.com, 
	Alexandru Lastur <alexandru.lastur@nxp.com>, arnaud.pouliquen@foss.st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 6:32=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hello Daniel,
>
> On Fri, Oct 18, 2024 at 02:09:29PM +0300, Daniel Baluta wrote:
> > Currently we generate notifyids in the linux kernel and override
> > those found in rsc_table.
> >
> > This doesn't play well with users expecting to use the exact ids
> > from rsc_table.
> >
> > So, use predefined notifyids found in rsc_table if any. Otherwise,
> > let Linux generate the ids as before.
> >
> > Keypoint is we also define an invalid notifid as 0xFFFFFFFFU. This
> > should be placed as notifids if users want Linux to generate the ids.
> >
> > Signed-off-by: Alexandru Lastur <alexandru.lastur@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 14 ++++++++++++--
> >  include/linux/remoteproc.h           |  1 +
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/=
remoteproc_core.c
> > index f276956f2c5c..9f00fe16da38 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -332,6 +332,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int=
 i)
> >       int ret, notifyid;
> >       struct rproc_mem_entry *mem;
> >       size_t size;
> > +     int start, end;
> >
> >       /* actual size of vring (in bytes) */
> >       size =3D PAGE_ALIGN(vring_size(rvring->num, rvring->align));
> > @@ -363,9 +364,18 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, in=
t i)
> >       /*
> >        * Assign an rproc-wide unique index for this vring
> >        * TODO: assign a notifyid for rvdev updates as well
> > -      * TODO: support predefined notifyids (via resource table)
> >        */
> > -     ret =3D idr_alloc(&rproc->notifyids, rvring, 0, 0, GFP_KERNEL);
> > +
> > +     start =3D 0;
> > +     end =3D 0;
> > +
> > +     /* use id if specified in rsc table */
> > +     if (rsc->vring[i].notifyid !=3D RSC_INVALID_NOTIFYID) {
> > +             start =3D rsc->vring[i].notifyid;
> > +             end =3D start + 1;
> > +     }
>
> This will likely introduce a backward compatibility issue where anyone th=
at
> has more than one vring and set their notifyids to anything else than 0xF=
FFFFFFF
> in the resource table will see a boot failure.
>
> A while back the openAMP group started discussions on using the configura=
tion
> space of a virtio device to enhance device discovery, with exactly this k=
ind of
> use case in mind.  I think it is the only way to move forward with this
> feature, though it is a big job that requires a lot of community interact=
ions.

I also found this attempt few years ago:

https://lkml.iu.edu/hypermail/linux/kernel/2001.2/05248.html

I think the best way to go is to bump the resource table version and suppor=
t
the old behavior for v1 and the new behavior for the new version
(which should be v2).

We will be back next week with a patch to express this.

thanks,
Daniel.
