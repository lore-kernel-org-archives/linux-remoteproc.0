Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04A5C433FE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:17:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96A1261381
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Oct 2021 16:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235259AbhJEQTQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:19:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:56168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhJEQTQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Oct 2021 12:19:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D77486137C;
        Tue,  5 Oct 2021 16:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633450645;
        bh=nQv7TJEC1TeCgBAiwKp27Mfu6BsaQKwTda6n316fuX8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1nIyA7ALvDj7ddhUgoWPXH8vgwq94IAIJdqo1jbt9uBl8yB/kAUrjMkADZMnkeVXJ
         YF9olLZHFpkYLvizwAqn+4wt1vFvoqq1FhMLUGGTsQq+YQTs1OqFiBhzC/LdCvZPwH
         eNZ/cxOLnq544/4tcHA9JzvMfske7q6VX8tJSFOk=
Date:   Tue, 5 Oct 2021 18:17:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jiri Slaby <jirislaby@kernel.org>, Suman Anna <s-anna@ti.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v8 2/2] tty: add rpmsg driver
Message-ID: <YVx6k1MMx0BTmgO6@kroah.com>
References: <20210930160520.19678-1-arnaud.pouliquen@foss.st.com>
 <20210930160520.19678-3-arnaud.pouliquen@foss.st.com>
 <YVxMKekWW0w0+qoM@kroah.com>
 <4cfc7497-ac85-828b-0b2f-a212c5a0503c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cfc7497-ac85-828b-0b2f-a212c5a0503c@foss.st.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Oct 05, 2021 at 06:03:25PM +0200, Arnaud POULIQUEN wrote:
> Hello Greg,
> 
> On 10/5/21 2:59 PM, Greg Kroah-Hartman wrote:
> > On Thu, Sep 30, 2021 at 06:05:20PM +0200, Arnaud Pouliquen wrote:
> >> This driver exposes a standard TTY interface on top of the rpmsg
> >> framework through a rpmsg service.
> >>
> >> This driver supports multi-instances, offering a /dev/ttyRPMSGx entry
> >> per rpmsg endpoint.
> >>
> >> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> >> ---
> >>  Documentation/serial/tty_rpmsg.rst |  15 ++
> >>  drivers/tty/Kconfig                |   9 +
> >>  drivers/tty/Makefile               |   1 +
> >>  drivers/tty/rpmsg_tty.c            | 275 +++++++++++++++++++++++++++++
> >>  4 files changed, 300 insertions(+)
> >>  create mode 100644 Documentation/serial/tty_rpmsg.rst
> >>  create mode 100644 drivers/tty/rpmsg_tty.c
> >>
> >> diff --git a/Documentation/serial/tty_rpmsg.rst b/Documentation/serial/tty_rpmsg.rst
> >> new file mode 100644
> >> index 000000000000..b055107866c9
> >> --- /dev/null
> >> +++ b/Documentation/serial/tty_rpmsg.rst
> >> @@ -0,0 +1,15 @@
> >> +.. SPDX-License-Identifier: GPL-2.0
> >> +
> >> +=========
> >> +RPMsg TTY
> >> +=========
> >> +
> >> +The rpmsg tty driver implements serial communication on the RPMsg bus to makes possible for
> >> +user-space programs to send and receive rpmsg messages as a standard tty protocol.
> >> +
> >> +The remote processor can instantiate a new tty by requesting a "rpmsg-tty" RPMsg service.
> >> +
> >> +The "rpmsg-tty" service is directly used for data exchange. No flow control is implemented.
> >> +
> >> +Information related to the RPMsg and associated tty device is available in
> >> +/sys/bus/rpmsg/devices/.
> > 
> > 
> > Why is this file needed?  Nothing references it, and this would be the
> > only file in this directory.
> 
> This file is created by the RPMsg framework, it allows to have information about
> RPMsg endpoint addresses associated to the rpmsg tty service instance.
> I can add this additional information to clarify the sentence.

As you are not tying in this into the kernel documentation build at all,
it makes no sense to add it.

Just use normal kernel-doc comments in your .c file and tie _THAT_ into
the kernel documentation build.  No need for a .rst file at all.

thanks,

greg k-h
