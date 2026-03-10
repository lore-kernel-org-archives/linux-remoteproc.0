Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21231717D
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155341; cv=none; b=WqBl0ddMi+QnO4gWusFS5IvlyEEFJL1PDGZJAxIcsj+01SuUQdFjQ8OLyUfn9cmnyucYSYdR5aXc4fmrzLLGOKpRKe9IHtD3hd4Kv7WiwH3eXwSglHzabhvGLtOSABdxAhz8Nu3Gpnj7Vv8yWWQuCq9xyQus3GEhahgXniFq9dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155341; c=relaxed/simple;
	bh=l66roiogcZuRuWdg/BN7GAGFpuk8qIZkWg5A5bU5kEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8rXH9vAshRL4voNFukJSO4/UQd8yHUJ5T50rZXJLDHv7mrIWKMrfD38syyrir91pekOSZvmjTwuX0XfJFCyUObQ3o2GJF+6Lbk/jZHu0OKn2iY1j9WkwzfNIi+z2QhE0Yr0u8wfj+vmBcXnFVXrLkHyqKiJD6WToa2R/Vjgf/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n6FtsrqG; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n6FtsrqG"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b95c0fc928bso582592866b.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 08:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773155334; x=1773760134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=n6FtsrqG2i8RIA3kuM8tvWWJG2Kpei1ONrNlrQER9c2EayILh4IIWKMJyQIB56mhrN
         Vx4uFXzc4FMlt6eI0Y3mJUIboi26ZK6AdRWdMYGmo9428Z+P8CFPrObkqJbTt2KIr6El
         av+s46ycF4HrzfNHtPZxew1vpF2xhpjIbn5eE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155334; x=1773760134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZrhwHJgKfQunIbqKLgGEw/Kos9vy+e6R49GEIQjjeck=;
        b=bgGPjbjq7gdQo/jJzO+ECU5rTNQo9WsSoWKFrzViUkgYDxeP4onmtelcCGvNqSHr1J
         RjxWZAYVVJsSUTbOgs8bu9tcudy8lzUZJXSJZ0bTFAFR7x36JR/XziurMarVGbuWj6XA
         lRFXxwE36DzF/UFmcezygf6yZqPK2DPHePRRa6UdL9vbkRcUtYMRA/+1bF2yaVNbGGd5
         HyfhhvcO89Zmzz6L2/dvQC3JbKhSEfhboTnS2KGuqZFtFH5nNw1In8GCkohArM7ycvVN
         MIFFFtzF/8fu2leZIYei7F43L4PfTtgamYNV0NMIsTd56t972JbgeyaXN2vBNHU2AhVH
         4BMw==
X-Forwarded-Encrypted: i=1; AJvYcCX+FL3xqiKM2i2maREB09LTXbH7Y0gRzZolIK8n1O707YsOYX4Ql+a8crB1/z/apU7Iphe21x58duZcgeWPM63M@vger.kernel.org
X-Gm-Message-State: AOJu0YxexQGwUEydzT682Ew4E1vqOXWA5/yqrWjDrltZnP0POUAVg5ub
	fQ9JXc5DcYZdoXrceBtFXgtr/Fv87uuJTGHBKHIeBUh/Bkt3hZ9WNsDzKT2089X8noe1icRXIrU
	j12cyo+fD
X-Gm-Gg: ATEYQzzto2HsIg+Ix9nsyEHAXCFjzG8ihtT4NXJtUVUcSxJD+Ene3y2bKqvjv+dURf7
	pGXhhIQEWMWV6qfVkiCW0ZRDXVa+KfSv4nJNcm0OrMHCPIEkkgxZVnhJOEAtrYIx8fIUsrf6Jfs
	38EpEF5ba+xAtMjoKjU0u7wom5Klhm+BHa17Ibde7H7dNd50hWfNq4+RUY/nMsoK4BhMD2oP9rE
	g1toShIdynzI1efurNhSxvex5pdO2qsArlFNtdCAfmAyRr5B0+ijfjwWVZ+HbLq56/ci7YqCJPa
	jEj/UZtWV7lhxXo1x5LWMrush4dSnK95nPW2yNcGnsMvYgEWc2zhftd787GJxP9MP+asIHjQvOy
	R5hwmNheWZJhzpiEYinEvuYEWUqVU7467tEzwqSILD19yjicdwzipaARP6XAn/CTSG5sQszzD+N
	msq3gv0EpAm0g3x0GxoEaOrdFPlcaj+O3A4xwNftdOYUmFvSpVxraeYemauIHYjA==
X-Received: by 2002:a17:907:844:b0:b94:858:580f with SMTP id a640c23a62f3a-b942e05ddacmr870274266b.61.1773155333569;
        Tue, 10 Mar 2026 08:08:53 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96dbd03678sm371358866b.13.2026.03.10.08.08.50
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:08:51 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so28114815e9.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 08:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4Ospidp6UcQiNeQ1Nq1DESUjL+nZ9j6ORZZ1rcjGfRzoSabtle3g00Z1PZ7HuCQWFtaJiWh4kGtrBjaU61LWu@vger.kernel.org
X-Received: by 2002:a05:600c:1d04:b0:47e:e7e5:ff32 with SMTP id
 5b1f17b1804b1-48526983292mr236479455e9.34.1773155329681; Tue, 10 Mar 2026
 08:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
 <20260216100943.v3.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid> <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
In-Reply-To: <CABb+yY2RKJgyNQ6789ua6s8C4tuOvhWqdcS16_4yU3AHjAiv_A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Mar 2026 08:08:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
X-Gm-Features: AaiRm51YHmAMmjPRIWQTSvpfsMBkAMaTT684zHe2XNjk21TEkEMaZPx6RHcKG9o
Message-ID: <CAD=FV=U4te2V7MaOrQ8kSibLazqUy_Kv3ZcJyAAaCAiGWOY1Gw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	lucaswei@google.com, mathieu.poirier@linaro.org, michal.simek@amd.com, 
	nm@ti.com, rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 9, 2026 at 8:24=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.com=
> wrote:
>
> Hi Doug,
>
> On Mon, Feb 16, 2026 at 12:11=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void=
 *mssg)
> >         if (!chan || !chan->cl)
> >                 return -EINVAL;
> >
> > +       /*
> > +        * The mailbox core gets confused when mbox_send_message() is c=
alled
> > +        * with NULL messages since the code directly stores messages i=
n
> > +        * `active_req` and assumes that a NULL `active_req` means no r=
equest
> > +        * is active. This causes the core to call the mailbox controll=
er a
> > +        * second time even if the previous message hasn't finished and=
 also
> > +        * means the client's tx_done() callback will never be called. =
However,
> > +        * clients historically passed NULL anyway. Deprecate passing N=
ULL
> > +        * here by adding a warning.
> > +        *
> > +        * Clients who don't have a message should switch to using
> > +        * mbox_ring_doorbell(), which explicitly documents the immedia=
te
> > +        * sending of doorbells, the lack of txdone, and what happens i=
f you
> > +        * mix doorbells and normal messages.
> > +        *
> > +        * TODO: when it's certain that all clients have transitioned, =
consider
> > +        * changing this to return -EINVAL.
> > +        */
> > +       if (!mssg)
> > +               dev_warn_once(chan->mbox->dev,
> > +                             "NULL mbox messages are deprecated; use m=
box_ring_doorbell\n");
> > +
> Does this patchset leave some such clients out?  If not, should we
> drop this block and return -EINVAL already?

This patchset series got all the clients that were in mainline at the
time I last checked. However, it was unclear to me if all the patches
would all go through your tree or not, since they don't touch mailbox
drivers but the somewhat widespread places that were clients of
mailbox.

If all the patches aren't going through your tree, we'll need to keep
it like this until we can confirm all of the clients have been
updated. If all the patcheds are going through your tree, then we
could make it return -EINVAL right away, but it we'd have to do that
as a last patch in the series. I think it would still make sense for
the first patch (which adds the mbox_ring_doorbell() call) to have a
warning like this and then a final patch to switch to -EINVAL. That
keeps things bisectable.

What do you think?

I'm happy to post a patch atop my series that switches it to -EINVAL
and you can land it whenever you see fit. Would that work?

-Doug
