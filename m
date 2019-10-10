Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Message-ID: <5d9ebbc4.1c69fb81.b45e2.25ce@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191009013345.17192-1-clew@codeaurora.org>
References: <20191009013345.17192-1-clew@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] rpmsg: glink: Remove channel decouple from rpdev release
Date: Wed, 09 Oct 2019 22:04:02 -0700
To: Chris Lew <clew@codeaurora.org>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Chris Lew (2019-10-08 18:33:45)
> If a channel is being rapidly restarted and the kobj release worker is
> busy, there is a chance the the rpdev_release function will run after
> the channel struct itself has been released.
>=20
> There should not be a need to decouple the channel from rpdev in the
> rpdev release since that should only happen from the channel close
> commands.
>=20
> Signed-off-by: Chris Lew <clew@codeaurora.org>

Fixes tag? The whole thing sounds broken and probably is still racy in
the face of SMP given that channel->rpdev is tested for "published" or
not. Can you describe the race that you're closing more?
