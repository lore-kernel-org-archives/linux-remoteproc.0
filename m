Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4ACC25B46
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Oct 2023 19:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjJWTwl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Oct 2023 15:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjJWTwl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Oct 2023 15:52:41 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4438F
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Oct 2023 12:52:38 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-53de8fc1ad8so5450628a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Oct 2023 12:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698090757; x=1698695557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhcOA8/ypFkMiD8dPsvfpUQgTECypKdIAwnlUaOnBwE=;
        b=JIVcUENZWiMfQUjVZbbgwJDD9neutBPqQcnqa2RWVSWt1xasRIxv7fyg3f5EslFqXC
         kfOGJpzuuWkHPNLKyPQTvF3zeu6NCKcf7ndLk3UBU6izPh8VJGvfy7HCa4szuuoZ92XY
         a5BQc9jVdKVDeR4GGUnlCi/Trr1MO0t2gnhWSPgqnCmQiIkoYplRU4D7B8ny3FqYODcV
         n0zig/6suBVI2AIaWgedW6mXv1IkJzhWaOVn4g/9xedAEX/rI5Rp0pTlit0f4RqJjsTM
         RmVoN7k00HLYNEpF6A74xzxD4mDB+5tFD+fTnH7bLar6etvxTxwAIVKF+AnQg7jbWsRW
         vU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698090757; x=1698695557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhcOA8/ypFkMiD8dPsvfpUQgTECypKdIAwnlUaOnBwE=;
        b=H+YF9fGDScwEnUgtUxO1y7Gtsb6Y1EWCcqLbljbiY2mflpHDH4TUJTykHxlrg2r++9
         Tr3zi57qVos+U0x91BPaSOTzDwFEbFe3Hamh0l8PpSKx8jqI6xrKASAvOmZ5WlaAk0IW
         X4E37xCHYRCRP2ZQv3dwo2yh9+twCFj500AuRWWT43YvceK3VCPOEN2drMrMQvRTNKSN
         G0BHgufofoDcxZHM5Y1MAu/aZGuTevy/rsCtIM/C5Qhu2AHp8dn2ONcDMXsfxEXfS5BO
         ML0FubPr/oh/M+aCEaiA6KikrYmig7GJGX/dDAaCgUweM52WGxoLMrvCw5/uKamPrS4e
         iN7A==
X-Gm-Message-State: AOJu0Ywnmu5avNmSKW1s/zQOdUmPxEAv77No3Q65yGsoKctBHGpWk/Js
        oqkJ7tsWDLZurubPAkzE6ebBwD0fq8H6kkON7Wgn7w==
X-Google-Smtp-Source: AGHT+IFqFcj3r9VY7mJnfbiSfqlKgl7GRNrIUMcA3NQ1icF+0bJbAaA7TnIl/XWALKZP69SuvXz0FXpRh5sNfms+vA0=
X-Received: by 2002:a05:6402:510d:b0:53e:7372:909f with SMTP id
 m13-20020a056402510d00b0053e7372909fmr8382503edd.22.1698090756886; Mon, 23
 Oct 2023 12:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20231023-strncpy-drivers-rpmsg-virtio_rpmsg_bus-c-v2-1-dc591c36f5ed@google.com>
 <ZTbMQC9IhcJR3a/a@p14s>
In-Reply-To: <ZTbMQC9IhcJR3a/a@p14s>
From:   Justin Stitt <justinstitt@google.com>
Date:   Mon, 23 Oct 2023 12:52:24 -0700
Message-ID: <CAFhGd8rbtz9Pw_kF0Z-Ke36FiFNNAjrFknM8p-oo-af-3gH14w@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: virtio: replace deprecated strncpy with strscpy/_pad
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Oct 23, 2023 at 12:40=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Mon, Oct 23, 2023 at 06:12:28PM +0000, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> >
> > This patch replaces 3 callsites of strncpy().
> >
> > The first two populate the destination buffer `nsm.name` -- which we
> > expect to be NUL-terminated based on their use with format strings.
> >
> > Firstly, as I understand it, virtio_rpmsg_announce_create() creates an
> > rpmsg_ns_msg and sends via:
> >
> > virtio_rpmsg_bus.c:
> > 336: err =3D rpmsg_sendto(rpdev->ept, &nsm, sizeof(nsm), RPMSG_NS_ADDR)=
;
> >
> > ... which uses:
> > virtio_rpmsg_sendto() -> rpmsg_send_offchannel_raw()
> >
> > ... which copies its data into an rpmsg_hdr `msg` in virtio_rpmsg_bus.c
> > 618: memcpy(msg->data, data, len);
> >
> > This callback is invoked when a message is received from the remote
> > processor:
> >
> > rpmsg_ns.c:
> > 30: /* invoked when a name service announcement arrives */
> > 31: static int rpmsg_ns_cb(struct rpmsg_device *rpdev, void *data, int =
len,
> > 32:                  void *priv, u32 src)
> > 33: {
> > 34:         struct rpmsg_ns_msg *msg =3D data;
> > ...
> > 50:         /* don't trust the remote processor for null terminating th=
e name */
> > 51:         msg->name[RPMSG_NAME_SIZE - 1] =3D '\0';
> >
> > ... which leads into the use of `name` within a format string:
> > rpmsg_ns.c:
> > 57: dev_info(dev, "%sing channel %s addr 0x%x\n",
> > 58:          rpmsg32_to_cpu(rpdev, msg->flags) & RPMSG_NS_DESTROY ?
> > 59:          "destroy" : "creat", msg->name, chinfo.dst);
> >
> > We can also observe that `nsm` is not zero-initialized and as such we
> > should maintain the NUL-padding behavior that strncpy() provides:
> >
> > virtio_rpmsg_bus.c:
> > 330: struct rpmsg_ns_msg nsm;
> >
> > Considering the above, a suitable replacement is `strscpy_pad` due to
> > the fact that it guarantees both NUL-termination and NUL-padding on the
> > destination buffer.
> >
> > Now, for the third and final destination buffer rpdev->id.name we can
> > just go for strscpy() (not _pad()) as rpdev points to &vch->rpdev:
> > |       rpdev =3D &vch->rpdev;
> >
> > ... and vch is zero-allocated:
> > |       vch =3D kzalloc(sizeof(*vch), GFP_KERNEL);
> >
> > ... this renders any additional NUL-byte assignments (like the ones
> > strncpy() or strscpy_pad() does) redundant.
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings [1]
> > Link: https://github.com/KSPP/linux/issues/90
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > ---
> > Changes in v2:
> > - update commit msg (thanks Mathieu)
> > - Link to v1: https://lore.kernel.org/r/20231021-strncpy-drivers-rpmsg-=
virtio_rpmsg_bus-c-v1-1-8abb919cbe24@google.com
> > ---
> > Note: build-tested only.
> >
> > Found with: $ rg "strncpy\("
> > ---
> >  drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
>
> I have applied all 3 of your patches.

Cheers!

>
> Thanks,
> Mathieu
>
> > diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rp=
msg_bus.c
> > index 905ac7910c98..dc87965f8164 100644
> > --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> > +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> > @@ -329,7 +329,7 @@ static int virtio_rpmsg_announce_create(struct rpms=
g_device *rpdev)
> >           virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> >               struct rpmsg_ns_msg nsm;
> >
> > -             strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > +             strscpy_pad(nsm.name, rpdev->id.name, sizeof(nsm.name));
> >               nsm.addr =3D cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> >               nsm.flags =3D cpu_to_rpmsg32(rpdev, RPMSG_NS_CREATE);
> >
> > @@ -353,7 +353,7 @@ static int virtio_rpmsg_announce_destroy(struct rpm=
sg_device *rpdev)
> >           virtio_has_feature(vrp->vdev, VIRTIO_RPMSG_F_NS)) {
> >               struct rpmsg_ns_msg nsm;
> >
> > -             strncpy(nsm.name, rpdev->id.name, RPMSG_NAME_SIZE);
> > +             strscpy_pad(nsm.name, rpdev->id.name, sizeof(nsm.name));
> >               nsm.addr =3D cpu_to_rpmsg32(rpdev, rpdev->ept->addr);
> >               nsm.flags =3D cpu_to_rpmsg32(rpdev, RPMSG_NS_DESTROY);
> >
> > @@ -424,7 +424,7 @@ static struct rpmsg_device *__rpmsg_create_channel(=
struct virtproc_info *vrp,
> >        */
> >       rpdev->announce =3D rpdev->src !=3D RPMSG_ADDR_ANY;
> >
> > -     strncpy(rpdev->id.name, chinfo->name, RPMSG_NAME_SIZE);
> > +     strscpy(rpdev->id.name, chinfo->name, sizeof(rpdev->id.name));
> >
> >       rpdev->dev.parent =3D &vrp->vdev->dev;
> >       rpdev->dev.release =3D virtio_rpmsg_release_device;
> >
> > ---
> > base-commit: 9c5d00cb7b6bbc5a7965d9ab7d223b5402d1f02c
> > change-id: 20231020-strncpy-drivers-rpmsg-virtio_rpmsg_bus-c-dba15db4e8=
90
> >
> > Best regards,
> > --
> > Justin Stitt <justinstitt@google.com>
> >
