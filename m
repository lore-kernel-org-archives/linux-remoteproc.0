Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310212728.GQ264362@yoga>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-3-bjorn.andersson@linaro.org> <158387214232.149997.3935472981193001512@swboyd.mtv.corp.google.com> <20200310212728.GQ264362@yoga>
Subject: Re: [PATCH v4 2/5] remoteproc: qcom: Introduce driver to store pil info in IMEM
From: Stephen Boyd <swboyd@chromium.org>
Date: Wed, 11 Mar 2020 16:25:42 -0700
Message-ID: <158396914211.149997.8114928596665644267@swboyd.mtv.corp.google.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-03-10 14:27:28)
> On Tue 10 Mar 13:29 PDT 2020, Stephen Boyd wrote:
>=20
> > Why can't we search in DT for the
> > imem node and then find the pil reloc info compatible string on the
> > first call to this library? Then we don't need an API to see if the
> > device has probed yet (qcom_pil_info_available)
>=20
> I think this sounds reasonable.

Great!

>=20
> > and we can just ioremap
> > some region of memory that's carved out for this reason. Forcing
> > everything through the regmap is mostly adding pain.
> >=20
>=20
> My concern here was simply that we'll end up ioremapping various small
> chunks of the imem region 10 (or so) times. But I agree that things
> would be cleaner here.

Alright. I'd like the ioremap() approach. ioremap() will "do the right
thing" and reuse mappings if they're already there and overlap in the
page. So it's OK that the syscon/simple-mfd exists and makes a device,
etc. etc., but we don't need to care about it. We can just ioremap() the
area and not worry that the regmap users may have a mapping to the same
place. This is a dedicated carveout inside IMEM so we're safe from other
meddling users.
