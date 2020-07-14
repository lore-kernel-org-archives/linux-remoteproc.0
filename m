Return-Path: <SRS0=gNgS=AZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 385C5C433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 08:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E226721BE5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Jul 2020 08:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com header.b="KZBh31PP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgGNIeC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Jul 2020 04:34:02 -0400
Received: from smtp1.axis.com ([195.60.68.17]:64957 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgGNIeB (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Jul 2020 04:34:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1513; q=dns/txt; s=axis-central1;
  t=1594715641; x=1626251641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yPIyi+r6Sam6BMh1LvjqkCOgwrjxWfE0YtcaPo8bqk4=;
  b=KZBh31PPT3VxkDYY6FQJg+BXdeXbeXCpWQPTrHK0A2YJ9TUJzaMbYlIo
   GzkR95ZMb93syH4CuxjJNiAwHKF4b64fhqKr0D2toVvsTXNeGE5h3Npvs
   mXsn7g6e8IDB5vNChKM0Si/pKml2VswpziG2V5Ul5AaU9+F5h3f3/pjds
   UtOgr8P1Vsz0V/J13XIJKJ2jj4v3roa1t9PbmHXZeMGXzWGjyAhaXpHZX
   5TSzaWD2ifJBmlxqA53Ymn0189CX7kNOJzZqnFCPbnYdwz1A0cZzVwA/e
   mNIpBDj2NReYMF4OIdqY5b7Wd6737ImrOG8s9SKGgd4jDE0y+zilz9z6K
   w==;
IronPort-SDR: z0YQg/ccfWzz7HtSAR2rkwO0IbqB0TgoeghPfS8IJ4DM5u+SwnQRVggbabE9Qyx/JbOCEdRauM
 cmrRAH0RuYTbDTtYI6IC/QwTFj+yGj5tvf2Cc8G3R3Z4vaBz04HkvBP6gZ5oWeRhskRKcGAULh
 9j7MCdGUPHgenKYvYFi/AMv9MKjGRXvw7TBZgQro4GA6EY6EbkVJYPZLU6kkOZgk8ny16FVitr
 q4gYZW7AkN0mrNqvDqeLAZYq9baEKUGHUF6A2VAIYsdaRiZsV6s6bJdz9adwx+XU26CzWMIWqV
 //s=
X-IronPort-AV: E=Sophos;i="5.75,350,1589234400"; 
   d="scan'208";a="10781944"
Date:   Tue, 14 Jul 2020 10:33:59 +0200
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
CC:     "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "sound-open-firmware@alsa-project.org" 
        <sound-open-firmware@alsa-project.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 5/5] vhost: add an RPMsg API
Message-ID: <20200714083359.wn4uoq3d7zzsddkc@axis.com>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200527180541.5570-6-guennadi.liakhovetski@linux.intel.com>
 <20200617191741.whnp7iteb36cjnia@axis.com> <20200618090341.GA4189@ubuntu>
 <20200618093324.tu7oldr332ndfgev@axis.com> <20200618103940.GB4189@ubuntu>
 <20200618135241.362iuggde3jslx3p@axis.com> <20200618141412.GD4189@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200618141412.GD4189@ubuntu>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jun 18, 2020 at 04:14:12PM +0200, Guennadi Liakhovetski wrote:
> On Thu, Jun 18, 2020 at 03:52:42PM +0200, Vincent Whitchurch wrote:
> > Note that "the Linux side" is ambiguous for AMP since both sides can be
> > Linux, as they happen to be in my case.  I'm running virtio/rpmsg
> > between two physical processors (of different architectures), both
> > running Linux.
> 
> Ok, interesting, I didn't know such configurations were used too. I understood 
> the Linux rpmsg implementation in the way, that it's assumed, that the "host" 
> has to boot the "device" by sending an ELF formatted executable image to it, is 
> that optional? You aren't sending a complete Linux image to the device side, 
> are you?

I do pack the zImage, the dtb, and the initramfs into an ELF (along with
a tiny "bootloader" with just a handful of instructions), but the
remoteproc framework is not tied to the ELF format since ->parse_fw()
and friends are overridable by the remoteproc driver.

> > virtio has distinct driver and device roles so the completely different
> > APIs on each side are understandable.  But I don't see that distinction
> > in the rpmsg API which is why it seems like a good idea to me to make it
> > work from both sides of the link and allow the reuse of drivers like
> > rpmsg-char, instead of imposing virtio's distinction on rpmsg.
> 
> Understand. In principle I'm open to this idea, but before I implement it it 
> would be good to know what maintainers think?

Certainly.
