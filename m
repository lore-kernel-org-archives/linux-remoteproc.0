Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6283CC2BB9A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25CC423EB0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 23:12:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391219AbgLJXLx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 18:11:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:49374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389345AbgLJXLa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 18:11:30 -0500
X-Gm-Message-State: AOAM531u9jIXpKuhEDHnYCx1lG6NqCpVqiZxkm/neSfPtPqkYQ31ca0B
        NEFaiY4uAWktETvPQo01fhulC7NTNtkLwPOuTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607641849;
        bh=PCQQKOjc6YjZumEOD1HngXXOffpY7WJSVffGBmVE2eY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TnrcK/moE7nkwoA3Zz9FgXqwnQlEGkMjC7dyAIYEyp2dwR1PKUkk2X8Wb3bhY0+K8
         cS4FeGf5HoRyJmhDcyJgPk0Osl8ZPnv2OUnMbuVOtkLK13FsRVFNsaQxriZnynzOgF
         UVJ96bMZKQq3Em7/+bk/3SeY1JXlEPZyAmU0GDJ7NfkWDAOoPZdN8OfOi0RomumxpU
         5aIY2eK92ra5Qq6STHHjPMCc0bT0lB890owNxnlBAdCq/bEpgHO6SjhF0vMNDr4OAE
         9GxbTEg2FisGYERWI5hR1XT/2aVNH4u6Ji6XIN2NUwSs/UNHvw9rxy5m7/DJkfzu1d
         SDJqGXjRmKGOg==
X-Google-Smtp-Source: ABdhPJwWbOKC/meXbDaIc6eEzcVZ1Jra1FcOfktJmaatdpoXHxeOHbOdTyqqLAwgi9t9ioSO0lTzDdmMwZ7T5b0MOt8=
X-Received: by 2002:a05:6402:1841:: with SMTP id v1mr9392182edy.194.1607641848145;
 Thu, 10 Dec 2020 15:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20201126210642.897302-1-mathieu.poirier@linaro.org>
 <20201126210642.897302-2-mathieu.poirier@linaro.org> <20201130173321.GB2662913@robh.at.kernel.org>
 <20201201234327.GA1248055@xps15>
In-Reply-To: <20201201234327.GA1248055@xps15>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 10 Dec 2020 17:10:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKq1zM569nPLYNgj9WUHWO98nYYt6dBvHzLRMCKq5=T8g@mail.gmail.com>
Message-ID: <CAL_JsqKq1zM569nPLYNgj9WUHWO98nYYt6dBvHzLRMCKq5=T8g@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] dt-bindings: remoteproc: Add bindind to support
 autonomous processors
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Dec 1, 2020 at 5:43 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Rob,
>
> On Mon, Nov 30, 2020 at 10:33:21AM -0700, Rob Herring wrote:
> > On Thu, Nov 26, 2020 at 02:06:28PM -0700, Mathieu Poirier wrote:
> > > This patch adds a binding to guide the remoteproc core on how to deal with
> > > remote processors in two cases:
> > >
> > > 1) When an application holding a reference to a remote processor character
> > >    device interface crashes.
> > >
> > > 2) when the platform driver for a remote processor is removed.
> > >
> > > In both cases if "autonomous-on-core-reboot" is specified in the remote
> > > processor DT node, the remoteproc core will detach the remote processor
> > > rather than switching it off.
> > >
> > > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-core.yaml  | 25 +++++++++++++++++++
> > >  1 file changed, 25 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> > > new file mode 100644
> > > index 000000000000..3032734f42a3
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> > > @@ -0,0 +1,25 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/remoteproc/remoteproc-core.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Binding for the remoteproc core applicable to all remote processors
> > > +
> > > +maintainers:
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +  - Mathieu Poirier <mathieu.poirier@linaro.org>
> > > +
> > > +description:
> > > +  This document defines the binding recognised by the remoteproc core that can
> > > +  be used by any remote processor in the subsystem.
> > > +
> > > +properties:
> > > +  autonomous-on-core-reboot:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      Used in two situations, i.e when a user space application releases the
> > > +      handle it has on the remote processor's character driver interface and
> > > +      when a remote processor's platform driver is being removed.  If defined,
> > > +      this flag instructs the remoteproc core to detach the remote processor
> > > +      rather than turning it off.
> >
> > Userspace? character driver? platform driver? remoteproc core? Please
> > explain this without OS specific terms.
>
> The remoteproc state machine is gaining in complexity and having technical terms
> in the binding's description helps understand when and how it should be used.  I
> could make it more generic but that will lead to confusion and abuse.

Explaining in Linux specific terms will confuse any other OS user.

>  Should I
> make it "rproc,autonomous-on-core-reboot" ?

No, 'rproc' is not a vendor.

> >
> > Seems to me this would be implied by functionality the remote proc
> > provides.
>
> Exactly - this binding is used by the remoteproc core itself.  It is specified
> in the remote processor DT nodes but the individual platform drivers don't do
> anything with it - the core takes care of enacting the desired behavior on their
> behalf.  Otherwise each platform driver would end up adding the same code, which
> nobody wants to see happening.

The platform drivers just need to set a flag to enable some behavior
that the core code checks and handles. That should be 1 to a few lines
in the drivers. It's not really any different, just a question of
where the flag lives.

Rob
