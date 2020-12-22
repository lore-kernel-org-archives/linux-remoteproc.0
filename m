Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF070C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 15:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 81E6D229C5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 15:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgLVP6g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Dec 2020 10:58:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgLVP6g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Dec 2020 10:58:36 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBCDC06179C
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Dec 2020 07:57:55 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id h4so12282757qkk.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 22 Dec 2020 07:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tSbt+6uAU0/n70HJg2Z4UTZW3SPBYifyx/RQerMQRfc=;
        b=v7KC8FXXHyCRgKzSN1WdkZDILxNnZ3Tz50y2318GZEHFh2OgiVvbWtDas110A8j1bC
         bEUiYC07U4pNjkhq5tMD+838LcJrm+4obowXGjaHsc3RA+uiGe0rNYbBNCKn52aZEwnC
         BmcivK/TRVARKJegXMu8ZFzRsFfrV6Y7RPlm3CCXYLmXCCvVZPZII7ey3+RAXWnuHYkw
         VbEPi9Vqp1tuNwtjvV0bwxS+nhv1FE0yn+SLr/afAFKEWLTfcHUaQtvx/8wiFeBmYSxX
         ZjtuPMNqwpNZohmsmlH7kRYZXt9GF3YqcZAdXzrmFIEU9pwaL8VXAIbq3OJSqwbpIN0G
         E/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tSbt+6uAU0/n70HJg2Z4UTZW3SPBYifyx/RQerMQRfc=;
        b=trsTqmDMqYIJn3CV1q+fDGmAhLUVnSKfhUMMn2Y1YzjRdofrcM0ZARoFJ6eI7nef6/
         4IEBaRe/yTMt39XE0UwI0Z3w5+4y1fwIk0uuqn3aHkc8Zi+tPXYiTId+HtnH0LynhErY
         RwHCV5HiAjh055DYWQnxFqiyh9pOkKumlaPt6vvyWHupSBKovRqQsL1bIXFFiTaKCahs
         uOgNK34G0Hnekrtc2A+pPsb8prGVUvyvrICVkuyt+wWurHmKd/WD0tD+8W6f0LSAlvC/
         gKQ1yCn0f/f7KyVvV62nyNxyYFtPkgG7RaEe2QGmReHheHL4EXBSXhosJ91AdDd8vbYx
         c39Q==
X-Gm-Message-State: AOAM5339LBufscB8P5wvtrqETs+VRqOAp5PAxDv0QiFSXHP32gsJ7Zv5
        BuysXrZ6SsVty3Q6aQKzv5IJImH19zELo+xKR9ApnA==
X-Google-Smtp-Source: ABdhPJyepNPHP4E52r1tz6fvELiPwmDt6Q5gFH4TExNWOuUpN0HYpkwqkhdR3ClOmYLtVmWMmX7T7ktkH+FPYq0fd1o=
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr23021282qki.421.1608652674817;
 Tue, 22 Dec 2020 07:57:54 -0800 (PST)
MIME-Version: 1.0
References: <20201211142933.25784-1-grzegorz.jaszczyk@linaro.org>
 <20201211142933.25784-2-grzegorz.jaszczyk@linaro.org> <20201214225842.GA2537432@robh.at.kernel.org>
 <CAMxfBF65ve2Pk5Uz5V1V_LfOLFUFKebVE8bzSjLT0nonuH8TDg@mail.gmail.com> <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
In-Reply-To: <CAL_JsqKpzZvdWJodzbqQBLZ-v98n3KaoTaYM-0iQ-_71hCbW8Q@mail.gmail.com>
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Date:   Tue, 22 Dec 2020 16:57:43 +0100
Message-ID: <CAMxfBF5q2hjiYANZNtxz-PD=pR73EpXBpnWuB4dqXD1a=f2=gg@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: Add PRU consumer bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Ohad Ben Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Anna, Suman" <s-anna@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "Bajjuri, Praneeth" <praneeth@ti.com>,
        Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Rob,

On Fri, 18 Dec 2020 at 23:51, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Dec 16, 2020 at 9:55 AM Grzegorz Jaszczyk
> <grzegorz.jaszczyk@linaro.org> wrote:
> >
> > Hi Rob,
> >
> > On Mon, 14 Dec 2020 at 23:58, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Fri, Dec 11, 2020 at 03:29:29PM +0100, Grzegorz Jaszczyk wrote:
> > > > From: Suman Anna <s-anna@ti.com>
> > > >
> > > > Add a YAML binding document for PRU consumers. The binding includes
> > > > all the common properties that can be used by different PRU consumer
> > > > or application nodes and supported by the PRU remoteproc driver.
> > > > These are used to configure the PRU hardware for specific user
> > > > applications.
> > > >
> > > > The application nodes themselves should define their own bindings.
> > > >
> > > > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > > > Signed-off-by: Tero Kristo <t-kristo@ti.com>
> > > > Signed-off-by: Suman Anna <s-anna@ti.com>
> > > > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > > > ---
> > > >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 64 +++++++++++++++++++
> > > >  1 file changed, 64 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > new file mode 100644
> > > > index 000000000000..2c5c5e2b6159
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> > > > @@ -0,0 +1,64 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/remoteproc/ti,pru-consumer.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Common TI PRU Consumer Binding
> > > > +
> > > > +maintainers:
> > > > +  - Suman Anna <s-anna@ti.com>
> > > > +
> > > > +description: |
> > > > +  A PRU application/consumer/user node typically uses one or more PRU device
> > > > +  nodes to implement a PRU application/functionality. Each application/client
> > > > +  node would need a reference to at least a PRU node, and optionally define
> > > > +  some properties needed for hardware/firmware configuration. The below
> > > > +  properties are a list of common properties supported by the PRU remoteproc
> > > > +  infrastructure.
> > > > +
> > > > +  The application nodes shall define their own bindings like regular platform
> > > > +  devices, so below are in addition to each node's bindings.
> > > > +
> > > > +properties:
> > > > +  prus:
> > >
> > > ti,prus
> >
> > Thank you - I will change and post v2 but with this I will run into
> > issues when this binding will be referenced by some consumer YAML
> > binding. Running dtbs_check in such case throws:
> > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' does not
> > match any of the regexes: 'pinctrl-[0-9]+'
> > In the same time if I will remove this property from that node I am getting:
> > ... k3-am654-base-board.dt.yaml: serial@28000: 'ti,prus' is a required property
> > as expected.
>
> Sounds like you didn't update 'ti,prus' in whatever schema you include
> this one from.
>
> >
> > Getting rid of the comma from this property name workarounds mentioned
> > problem (which is not proper but allows me to correctly test this
> > binding): e.g. s/ti,prus/ti-pruss/ or using the previous name without
> > a comma.
> > It seems to be an issue with dtbs_check itself which we will encounter
> > in the future.
>
> If not, can you point me to a branch having this problem.

Sure, here is temporary branch with 4 last commits demonstrating
mentioned issues (when property name contains comma):
https://git.linaro.org/people/grzegorz.jaszczyk/linux.git/log/?h=ti-pruss-binding-issue

The last commit gets rid of the comma from properties names which
successfully w/a the problem.

Please note that those are only TEMP commits which demonstrates the
mentioned issue. I've put error logs with some notes in commit log to
ease understanding what issues are seen when.

Thank you in advance,
Grzegorz
