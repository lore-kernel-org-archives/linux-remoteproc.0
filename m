Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793169098;
	b=pLJWDwXhPBdoZMrTzNhph2nLhnRVBjLZADhJpSdeBrKOFXs8CLYQI8iEAzW8hYD22YTz
	 txP2GL39hV39lek7kBCLdOpk90fKP6MYbS7Ie1e7csbBhtEY42jTYMNKkvf2quexygvU/
	 i+/Np03BdRBpwrWaq8eqOfgnqNY2EAO7kGv3Y2gj+J0rHHNxH17iW60dWEttQAyCkFhsW
	 7ghnb6xS0aciwLVtOFtyx6wHzBm6ARloH5O4mNS4olNMKlBsojBZyd4IsWxtn0suCncye
	 YW1kS3Hoko41VbmTKG8yZhJVsXPPlBR5oUTKuzF8NyB4XoQyVDA9IfP+wmQeIRasFgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793169098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
	b=nntfUVdXjD0q4o3pqj3bmpcLAzQxgVzv92ZnrOU1/7Crw0Fks6nSD7lnr1vh2SP8oTQc
	 nhDZZ85m2dxnaZEiZlW9yeuZJo7bV81kU834uao1sJQdqfWcHDEUe0cnaRUn5K07WDtwp
	 NEPb6tiOWX4nTBfhDk6FsE6jgA+eRrGsMraltnI+E0pGrj/wcD7sRIrPSlNlpCCeeO751
	 KFi5LdSrgGLsqAxysc6+Z+lNAzjrOEATFePQptJoqcNGwBasy1b6ikdl//mf7LjWCzrcy
	 xwCz5FLo+uL05lUsIebVOCsIU5Abq0vmwg66oMZ9BhfY+J4o6bgwihmZQqQUX7T7cAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B09Y7vdV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363FE606A31D
	for <linux-remoteproc@vger.kernel.org>; Wed, 28 Oct 2026 06:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363FE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B09Y7vdV
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a01cac8733so496270b3a.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Oct 2026 23:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793169097; cv=none;
        d=google.com; s=arc-20260327;
        b=jVyXyEVasAicRgwr8atsAB3kElsZNB2JG7ruhNcdXUmYSBgELYJgV/SK8CBzSWgDwJ
         8vJo7ys3z0UBWhY3+XBTy8k5Lz1pnmHKHDEkWcf7eAvmPk4LyIJFEfMFRbG1z8/l3OFW
         qGv8YWmi0RvstAbCg4xTohCg1aGbqcrXG881Wdg1kaa+V9KB9LIFGo5FXrns389IJvHq
         L7GfKuujObvFEkjC2BM/1j3BdGo7XDglnEvkDKrbo+kjO59hz2onzOSLmNOCVyT2LYUl
         X7J6LVWGXLww9kdTFArJkI7KdI9DDyi2YLw9itDokDCkmanS+zxHb0lxp7/YyvBObaGF
         ZAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        fh=7EisyyXG+S4LYet4l9Yj4U4DZCHOVR8ilr95CnsEXq4=;
        b=ExXcDlwWWF/fUFT9tuPFN0wF1H14gH0PsQFjJ58rOTq+I+nbfGlZoOkY0pO47bnAeZ
         mYScC41Rp3MQDHgkNmDsBXoW6BJ8QAVyiTuYYueSI9GM8EDcqyBHkzkrthplFyf6opdZ
         HbVrH+b7SYVi7luORVxh5Euk8u9mKVoxbTe34P1BD3Z7bu68yqyLjwN/7BSjXncIx4jD
         F19Ab8wBApxlXco+7NDzx14jG6k2TiO8zdX3nFm+6IxYBr/3KWKPZPmKrbiNkaazDTdk
         eccYFcEYtJqpD4px/hvm42HyEL4/RvkPKvg8sXhqjboOzfFDclI/BpsXlX76QjydCVUh
         Iykw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793169097; x=1793773897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        b=B09Y7vdVJYZw60Pwnixl/wIPa2quHhCWMivLPFSvp/vsGqTgEAvt/J5eKNOlQEfcjm
         vAHwY7/L8sSlHPGtxmZCquSNwwNCvOdXptqPsxcKJ3TzKKXHX2tyEWARsnlPXx/YcilG
         Z0fxMelygD7uuK/GGJnC4eJwF2xyrZEMQAysn0OqZdwyaMKDSPrQHlzwVWsvvv2YBRIF
         VlM0UwngpulwvtXSbs0j+SDEdN9NDrnoPPEuwdua/ya4ehtMXslYPKgrdqIe7+jZyJWu
         yDMWFZX4s4SJnmt+Ffm39we48eUw0Tgj7td9vyfm/Qtbr9FZvxxnA7koTeYgrMoqtOo+
         hrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793169097; x=1793773897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q3gM5Luu6vI28PjmhPAEQ6TEdK5ARDl4ei6yQBf8kDA=;
        b=wRaCASn4DxTznB5nmMQt4u90SSwa/IGcwambn1BQEJwLeOEPOaLAO0kVm8cb+o9mll
         OKtcCPrNKrTKq6IgVTPIYzUyrFS5CEJrfjnnTHLkvpsghxtyh++3UDAOMFj0k6BivOWC
         Yixp31I9mpQ4Fp7xLmV6c/GqZucyj+4xjLHBVcWLPOqskGhe+QGaRUFWDOdTu/mdr9wE
         vhSAyRdYQc3pDWk+AiJ7nWvKk9Mpf/fJHewsrobdeJGd7hEtGZMOPx2MZLqtXwsTBIdR
         1P/eFNuYfYyQnEK/ua6V97xK5IaR417sUXVOOgo2zWAs+fZtT3ZMWt/MiDo8gMrC00ZQ
         lVQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3nLPKY8+RdXKWI9IZ/0ODXDq3JC8Sl1kJiokXUBsP6xikeX1zbxOok/TY4Eb9MpB8UP8ZEaIy0U1hYwohh7m3@vger.kernel.org
X-Gm-Message-State: AFq9FYIKzxJS9rYAAAooVQ8en0pP8Vyq8TqYDw+07K+xsBnWTSDD4eYj
	pwTgh4mVRgN0v+P7Phq7GWawvaw4eetihmShlT1XNCIJIflwpF3ZVS1BNovAdkN0tlmTOwPCkBf
	C5K2tqNNAwHaQEJ0njCUAopQ7NByOaac=
X-Gm-Gg: AYBFou2n9Ya6xzUGGFMA1/5v8ezKqszEdQqqHOF9GQn3ZwyRC90tbFra8bOayGdeuCQ
	HYTO1l/t2lm3CEg49WL7OWAAYjy7dctS5juMVJ6+SdENnL+HbtBPH7jxzjpjyeU9Q5NV1OR6oZw
	NJlvB0va5OsQ80bPbVqQcjUzOgX0fAfwoxu7dZ4Q3PuWhHjVhKNNEzFIqhNB01kUsnsAxz3pHtC
	K6WKFBpS7hrLcj3OohZq2fAjch4igAoUHf8Z80vTkrBGBQep3B7CXSOvnBIzIp7EFWolP3gL8Us
	TIJpOJhVRHQZcLYSHVF1koFIIaI6Rpliur/R+VSwk4i6wD+Mjvs/QIZqyQlWgHwodB4nZH3Tcfo
	fz813/Wvh4KLisC7FG0EeXX6zl3lQ30jd2W5Z3w==
X-Received: by 2002:a05:6a00:bd04:b0:89e:3ccd:b3c7 with SMTP id
 d2e1a72fcca58-8a6e75cf5ecmr1113257b3a.33.1793169097500; Tue, 27 Oct 2026
 23:31:37 -0700 (PDT)
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014103241.3847-1-sid9.karanam@gmail.com> <11c794c1-6fb2-4a21-a127-4762c6f45699@ti.com>
In-Reply-To: <11c794c1-6fb2-4a21-a127-4762c6f45699@ti.com>
From: Sidd <sid9.karanam@gmail.com>
Date: Wed, 28 Oct 2026 12:01:23 +0530
X-Gm-Features: AclHuK9wwib5U8oGIgouyIs5-olf5nbQKP2hXA6sdZQe95ce4Bc2ClNw_KUuXZw
Message-ID: <CABM86pxVyAc8iSqGJqO+-_+UJbfEkH4c1Q2o2mr2B28OswqXJw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
To: "Padhi, Beleswar" <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> You might be interested in this:
> https://lore.kernel.org/all/20261027140751.2465743-1-b-padhi@ti.com/

Sounds good, am assuming the RFC will be implemented after this is
merged (provided this patch has no issues) right?

Thanks,
Siddharth

On Tue, Oct 27, 2026 at 7:42=E2=80=AFPM Padhi, Beleswar <b-padhi@ti.com> wr=
ote:
>
>
> On 10/14/2026 4:02 PM, Siddharth Karanam wrote:
> > The previous version of the patch had a new header ti_sci_dev.h,
> > that mirrors ti_sci_proc.h in terms of the struct decl and
> > its helper function structure, with the goal of abstracting
> > all ti_sci_handle's members like ti_sci_dev_ops from being
> > invoked directly in the driver code.
> >
> > Lore link to the v1 patch:
> > https://lore.kernel.org/all/20260922191453.324983-1-sid9.karanam@gmail.=
com/
> >
> > Upon discussing in the original patch thread, it seemed
> > better to combine ti_sci_proc.h and ti_sci_dev.h's structs
> > and merge all their helpers into a single header. That is
> > what ti_sci_ctrl.h aims to do: It has the union of tsd
> > (ti_sci_dev) and tsp (ti_sci_proc) and both their helper
> > functions are prefixed with ti_sci_ctrl_dev and
> > ti_sci_ctrl_proc respectively.
> >
> > The goal of the patch (v2) is to maintain a single source of origin
> > for all ti_sci_dev/proc_ops call sites. Any stray calls
> > to dev_ops/proc_ops function pointer members in driver code should
> > eventually be abstracted through this header (ti_sci_ctrl.h).
> >
> > In the future we can try to abstract tsd's dev_ops even further
> > through pm_runtime, but there are some roadblocks that
> > I am unaware of, so that warranties a different patch.
>
>
> You might be interested in this:
>
> https://lore.kernel.org/all/20261027140751.2465743-1-b-padhi@ti.com/
>
> Thanks,
> Beleswar
>
> >
> > Siddharth Karanam (2):
> >    remoteproc: Add ti_sci_dev_ops abstraction
> >    remoteproc: Merge ti_sci_dev and ti_sci_proc abstraction
> >
> >   drivers/remoteproc/ti_k3_common.c         |  21 +--
> >   drivers/remoteproc/ti_k3_common.h         |   6 +-
> >   drivers/remoteproc/ti_k3_dsp_remoteproc.c |  26 ++--
> >   drivers/remoteproc/ti_k3_m4_remoteproc.c  |  23 ++-
> >   drivers/remoteproc/ti_k3_r5_remoteproc.c  |  66 +++-----
> >   drivers/remoteproc/ti_sci_ctrl.h          | 177 +++++++++++++++++++++=
+
> >   drivers/remoteproc/ti_sci_proc.h          | 130 ----------------
> >   7 files changed, 231 insertions(+), 218 deletions(-)
> >   create mode 100644 drivers/remoteproc/ti_sci_ctrl.h
> >   delete mode 100644 drivers/remoteproc/ti_sci_proc.h
> >
