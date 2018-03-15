Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20180315181244.8859-1-bjorn.andersson@linaro.org>
References: <20180315181244.8859-1-bjorn.andersson@linaro.org>
Message-ID: <152113980179.111154.13908491838747798092@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] Revert "rpmsg: smd: Create device for all channels"
Date: Thu, 15 Mar 2018 11:50:01 -0700
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2018-03-15 11:12:44)
> In an effort to pick up channels that are in a funky state we
> optimistically tried to open all channels that we found, with the
> addition that we failed if the other side did not handshake the opening.
> =

> But as we're starting the modem a second time all channels are found -
> in a "funky" state - and we try to open them. But the modem firmware
> requires the IPCRTR to be up in order to initialize. So any channels we
> try to open before that will fail and will not be opened again.
> =

> This takes care of the regression, at the cost of reintroducing the
> previous behavior of handling of channels with "funky" states.

Is it a funky chicken and egg problem between IPCRTR and smd?
