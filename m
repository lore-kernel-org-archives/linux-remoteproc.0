Return-Path: <swboyd@chromium.org>
Return-Path: <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310063338.3344582-5-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org> <20200310063338.3344582-5-bjorn.andersson@linaro.org>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: qcs404: Add IMEM and PIL info region
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 10 Mar 2020 11:11:23 -0700
Message-ID: <158386388355.149997.17460216194595657584@swboyd.mtv.corp.google.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Quoting Bjorn Andersson (2020-03-09 23:33:37)
> Add a simple-mfd representing IMEM on QCS404 and define the PIL
> relocation info region, so that post mortem tools will be able to locate
> the loaded remoteprocs.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
