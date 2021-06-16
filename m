Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2FFC48BE5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 09:19:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EBE861107
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Jun 2021 09:19:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhFPJVx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Jun 2021 05:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231727AbhFPJVw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Jun 2021 05:21:52 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4DCC061767
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jun 2021 02:19:46 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id u18so832597plc.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Jun 2021 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kPlAhH5NwHtkd7QRuZaAQDneGzyCnvuOWwqDYkreipQ=;
        b=d1cdxgTVmHQ8vSHU6CQuC6D7FOcaN4RAGY/AKSUKANPKxFjiMvq+2d7vXm4MFvyMqY
         iHSCrCkw53XV7cfDQeI4CSgVdnG/slT9uecRaDIaNcZcE0jEEIkyr+liwGbTclMf32Lz
         3kc5gdxGpXHy9ibF2+/ruLay5caxWAcFMMGfGwzvZa99SDvF71KoPs20v16MbVVvNThn
         e7EwX+SbjnEb1M90XqprBxwyjA14XWDsirVirt4oGZBalJ9HENtjL87hbzjicLT2er9q
         bWUZ3tJ7F/QCXBpg03nc1u24/IA0SjImkjGOWEgtYQnRMOWOhZFD5RHuner0TXE9zzUh
         vM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kPlAhH5NwHtkd7QRuZaAQDneGzyCnvuOWwqDYkreipQ=;
        b=IS8CuOPBxXddQVJfOAmahHfbAmJwYLb7oymVkPxlrKN6JSR0r/aR+24zB4XFNun/8M
         rvbTsvf25L4dlEWx+6tMF87ScPsRew5xODzd0XeghaGYqZUvbjzsuHexjzIH9zFVuQ/I
         8i52K34Gs4aSS6fWCicYt5b54dSCpbPodm1/IAAIvGZxhcAdUvOElsA1WszjHvhDOoQi
         QRra3UjzX5YkvdJv4xi8hF85Dt1ElMnb/AVLNdNPPWsiIdXGh/ifi0iird7VOGf6PmBg
         ML8/90ddtmK5Vmz4ECU0025YL1EJr94j+nDck6eXsbmOmP13ST9/+UI717+A7MCndzvW
         oPMQ==
X-Gm-Message-State: AOAM532AA/WcNt+x1coFP/MIwdddLLe6YX0Ru+bGf4Zg9i1VkfhVAqTR
        iYQmTNPsC01BcADQ36m/Eo8WWP++hSYYKpfEsv2ccw==
X-Google-Smtp-Source: ABdhPJwjB6l7t81zu3o2PHt0sQ07v6Dqz5kXjbEEJ1pXJG0cIRo8caGDMT7G0iqSMi8MlbtkFjcI3kFdFCuG+wVZP5Y=
X-Received: by 2002:a17:90a:d590:: with SMTP id v16mr3926450pju.205.1623835186136;
 Wed, 16 Jun 2021 02:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210615133229.213064-1-stephan@gerhold.net> <20210615133229.213064-4-stephan@gerhold.net>
 <CAMZdPi8JuyqoF3GwJHcdXhdn0e7ks_f2WiUFpmn3E8HH7T_Gng@mail.gmail.com> <YMkkUM3fHcWhYhmV@gerhold.net>
In-Reply-To: <YMkkUM3fHcWhYhmV@gerhold.net>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 16 Jun 2021 11:28:46 +0200
Message-ID: <CAMZdPi877Qu5F+mYqD0tAm5-gewpHHwpa2Xp7DAn8OM8rxVLMA@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: wwan: Allow WWAN drivers to provide
 blocking tx and poll function
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        M Chetan Kumar <m.chetan.kumar@intel.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Network Development <netdev@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        phone-devel@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 16 Jun 2021 at 00:06, Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Tue, Jun 15, 2021 at 11:24:41PM +0200, Loic Poulain wrote:
> > On Tue, 15 Jun 2021 at 15:34, Stephan Gerhold <stephan@gerhold.net> wrote:
> > >
> > > At the moment, the WWAN core provides wwan_port_txon/off() to implement
> > > blocking writes. The tx() port operation should not block, instead
> > > wwan_port_txon/off() should be called when the TX queue is full or has
> > > free space again.
> > >
> > > However, in some cases it is not straightforward to make use of that
> > > functionality. For example, the RPMSG API used by rpmsg_wwan_ctrl.c
> > > does not provide any way to be notified when the TX queue has space
> > > again. Instead, it only provides the following operations:
> > >
> > >   - rpmsg_send(): blocking write (wait until there is space)
> > >   - rpmsg_trysend(): non-blocking write (return error if no space)
> > >   - rpmsg_poll(): set poll flags depending on TX queue state
> > >
> > > Generally that's totally sufficient for implementing a char device,
> > > but it does not fit well to the currently provided WWAN port ops.
> > >
> > > Most of the time, using the non-blocking rpmsg_trysend() in the
> > > WWAN tx() port operation works just fine. However, with high-frequent
> > > writes to the char device it is possible to trigger a situation
> > > where this causes issues. For example, consider the following
> > > (somewhat unrealistic) example:
> > >
> > >  # dd if=/dev/zero bs=1000 of=/dev/wwan0p2QMI
> > >  dd: error writing '/dev/wwan0p2QMI': Resource temporarily unavailable
> > >  1+0 records out
> > >
> > > This fails immediately after writing the first record. It's likely
> > > only a matter of time until this triggers issues for some real application
> > > (e.g. ModemManager sending a lot of large QMI packets).
> > >
> > > The rpmsg_char device does not have this problem, because it uses
> > > rpmsg_trysend() and rpmsg_poll() to support non-blocking operations.
> > > Make it possible to use the same in the RPMSG WWAN driver by extending
> > > the tx() operation with a "nonblock" parameter and adding an optional
> > > poll() callback. This integrates nicely with the RPMSG API and does
> > > not break other WWAN drivers.
> > >
> > > With these changes, the dd example above blocks instead of exiting
> > > with an error.
> > >
> > > Cc: Loic Poulain <loic.poulain@linaro.org>
> > > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > > ---
> > > Note that rpmsg_poll() is an optional callback currently only implemented
> > > by the qcom_smd RPMSG provider. However, it should be easy to implement
> > > this for other RPMSG providers when needed.
> > >
> > > Another potential solution suggested by Loic Poulain in [1] is to always
> > > use the blocking rpmsg_send() from a workqueue/kthread and disable TX
> > > until it is done. I think this could also work (perhaps a bit more
> > > difficult to implement) but the main disadvantage is that I don't see
> > > a way to return any kind of error to the client with this approach.
> > > I assume we return immediately from the write() to the char device
> > > after scheduling the rpmsg_send(), so we already reported success
> > > when rpmsg_send() returns.
> > >
> > > At the end all that matters to me is that it works properly, so I'm
> > > open for any other suggestions. :)
> > >
> > > [1]: https://lore.kernel.org/linux-arm-msm/CAMZdPi_-Qa=JnThHs_h-144dAfSAjF5s+QdBawdXZ3kk8Mx8ng@mail.gmail.com/
> > > ---
> > >  drivers/net/wwan/iosm/iosm_ipc_port.c |  3 ++-
> > >  drivers/net/wwan/mhi_wwan_ctrl.c      |  3 ++-
> > >  drivers/net/wwan/rpmsg_wwan_ctrl.c    | 17 +++++++++++++++--
> > >  drivers/net/wwan/wwan_core.c          |  9 ++++++---
> > >  drivers/net/wwan/wwan_hwsim.c         |  3 ++-
> > >  include/linux/wwan.h                  | 13 +++++++++----
> > >  6 files changed, 36 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/net/wwan/iosm/iosm_ipc_port.c b/drivers/net/wwan/iosm/iosm_ipc_port.c
> > > index beb944847398..2f874e41ceff 100644
> > > --- a/drivers/net/wwan/iosm/iosm_ipc_port.c
> > > +++ b/drivers/net/wwan/iosm/iosm_ipc_port.c
> > > @@ -31,7 +31,8 @@ static void ipc_port_ctrl_stop(struct wwan_port *port)
> > >  }
> > >
> > >  /* transfer control data to modem */
> > > -static int ipc_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
> > > +static int ipc_port_ctrl_tx(struct wwan_port *port, struct sk_buff *skb,
> > > +                           bool nonblock)
> > >  {
> > >         struct iosm_cdev *ipc_port = wwan_port_get_drvdata(port);
> > >
> > > diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> > > index 1bc6b69aa530..9754f014d348 100644
> > > --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> > > +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> > > @@ -139,7 +139,8 @@ static void mhi_wwan_ctrl_stop(struct wwan_port *port)
> > >         mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
> > >  }
> > >
> > > -static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
> > > +static int mhi_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb,
> > > +                           bool nonblock)
> > >  {
> > >         struct mhi_wwan_dev *mhiwwan = wwan_port_get_drvdata(port);
> > >         int ret;
> > > diff --git a/drivers/net/wwan/rpmsg_wwan_ctrl.c b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> > > index de226cdb69fd..63f431eada39 100644
> > > --- a/drivers/net/wwan/rpmsg_wwan_ctrl.c
> > > +++ b/drivers/net/wwan/rpmsg_wwan_ctrl.c
> > > @@ -54,12 +54,16 @@ static void rpmsg_wwan_ctrl_stop(struct wwan_port *port)
> > >         rpwwan->ept = NULL;
> > >  }
> > >
> > > -static int rpmsg_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
> > > +static int rpmsg_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb,
> > > +                             bool nonblock)
> > >  {
> > >         struct rpmsg_wwan_dev *rpwwan = wwan_port_get_drvdata(port);
> > >         int ret;
> > >
> > > -       ret = rpmsg_trysend(rpwwan->ept, skb->data, skb->len);
> > > +       if (nonblock)
> > > +               ret = rpmsg_trysend(rpwwan->ept, skb->data, skb->len);
> > > +       else
> > > +               ret = rpmsg_send(rpwwan->ept, skb->data, skb->len);
> > >         if (ret)
> > >                 return ret;
> > >
> > > @@ -67,10 +71,19 @@ static int rpmsg_wwan_ctrl_tx(struct wwan_port *port, struct sk_buff *skb)
> > >         return 0;
> > >  }
> > >
> > > +static __poll_t rpmsg_wwan_ctrl_poll(struct wwan_port *port, struct file *filp,
> > > +                                    poll_table *wait)
> > > +{
> > > +       struct rpmsg_wwan_dev *rpwwan = wwan_port_get_drvdata(port);
> > > +
> > > +       return rpmsg_poll(rpwwan->ept, filp, wait);
> > > +}
> > > +
> > >  static const struct wwan_port_ops rpmsg_wwan_pops = {
> > >         .start = rpmsg_wwan_ctrl_start,
> > >         .stop = rpmsg_wwan_ctrl_stop,
> > >         .tx = rpmsg_wwan_ctrl_tx,
> > > +       .poll = rpmsg_wwan_ctrl_poll,
> > >  };
> > >
> > >  static struct device *rpmsg_wwan_find_parent(struct device *dev)
> > > diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> > > index 7e728042fc41..c7fd0b897f87 100644
> > > --- a/drivers/net/wwan/wwan_core.c
> > > +++ b/drivers/net/wwan/wwan_core.c
> > > @@ -500,7 +500,8 @@ static void wwan_port_op_stop(struct wwan_port *port)
> > >         mutex_unlock(&port->ops_lock);
> > >  }
> > >
> > > -static int wwan_port_op_tx(struct wwan_port *port, struct sk_buff *skb)
> > > +static int wwan_port_op_tx(struct wwan_port *port, struct sk_buff *skb,
> > > +                          bool nonblock)
> > >  {
> > >         int ret;
> > >
> > > @@ -510,7 +511,7 @@ static int wwan_port_op_tx(struct wwan_port *port, struct sk_buff *skb)
> > >                 goto out_unlock;
> > >         }
> > >
> > > -       ret = port->ops->tx(port, skb);
> > > +       ret = port->ops->tx(port, skb, nonblock);
> > >
> > >  out_unlock:
> > >         mutex_unlock(&port->ops_lock);
> > > @@ -637,7 +638,7 @@ static ssize_t wwan_port_fops_write(struct file *filp, const char __user *buf,
> > >                 return -EFAULT;
> > >         }
> > >
> > > -       ret = wwan_port_op_tx(port, skb);
> > > +       ret = wwan_port_op_tx(port, skb, !!(filp->f_flags & O_NONBLOCK));
> > >         if (ret) {
> > >                 kfree_skb(skb);
> > >                 return ret;
> > > @@ -659,6 +660,8 @@ static __poll_t wwan_port_fops_poll(struct file *filp, poll_table *wait)
> > >                 mask |= EPOLLIN | EPOLLRDNORM;
> > >         if (!port->ops)
> > >                 mask |= EPOLLHUP | EPOLLERR;
> > > +       else if (port->ops->poll)
> > > +               mask |= port->ops->poll(port, filp, wait);
> >
> > I'm not sure it useful here because EPOLLOUT flag is already set above, right?
> >
>
> Oops, you're right - sorry! I thought the flags are inverted (only set
> if (is_write_blocked())), then it would have worked fine. :)
>
> I think this should be easy to fix though, I can just make the
>
>         if (!is_write_blocked(port))
>                 mask |= EPOLLOUT | EPOLLWRNORM;
>
> if statement conditional to (port->ops->poll == NULL). It only makes
> sense to supply the poll() op if the built-in write-blocking cannot be
> used easily (like in my case).

Yes, so maybe in that case poll ops should be renamed to something like tx_poll?

Regards,
Loic
