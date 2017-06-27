Return-Path: <arndbergmann@gmail.com>
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170627064309.16507-1-bjorn.andersson@linaro.org>
References: <20170627064309.16507-1-bjorn.andersson@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Jun 2017 09:29:19 +0200
Message-ID: <CAK8P3a0d69ZkVPtHnmLpMf2uft=XX8CyftPKizGuowJZcQv=zQ@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: Solve circular dependencies involving RPMSG_VIRTIO
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Peter Griffin <peter.griffin@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hugues Fruchet <hugues.fruchet@st.com>, Loic Pallardy <loic.pallardy@st.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Jun 27, 2017 at 8:43 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> While it's very common to use RPMSG for communicating with firmware
> running on these remoteprocs there is no functional dependency on RPMSG.
> As such RPMSG should be selected by the system integrator and not
> automatically by the remoteproc drivers.
>
> This does solve problems reported with circular Kconfig dependencies for
> Davinci and Keystone remoteproc drivers.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>
