Return-Path: <xiaoxiang781216@gmail.com>
MIME-Version: 1.0
References: <1547031403-34535-1-git-send-email-loic.pallardy@st.com>
In-Reply-To: <1547031403-34535-1-git-send-email-loic.pallardy@st.com>
From: xiang xiao <xiaoxiang781216@gmail.com>
Date: Sun, 13 Jan 2019 02:28:41 +0800
Message-ID: <CAH2Cfb_4qFAEjiANLpRmQL5o9-JCPHCBULLz5-r=zbK9EwiT_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] remoteproc: fix recovery procedure
Content-Type: text/plain; charset="UTF-8"
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, s-anna@ti.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,
The change just hide the problem, I think. The big issue is:
1.virtio devices aren't destroyed by rpproc_stop
2.and then rpmsg child devices aren't destroyed too
Then, when the remote start and create rpmsg channel again, the
duplicated channel will appear in kernel.
To fix this problem, we need go through rpproc_shutdown/rproc_boot to
destroy all devices(virtio and rpmsg) and create them again.

Thanks
Xiang

On Wed, Jan 9, 2019 at 6:56 PM Loic Pallardy <loic.pallardy@st.com> wrote:
>
> Commit 7e83cab824a87e83cab824a8 ("remoteproc: Modify recovery path
> to use rproc_{start,stop}()") replaces rproc_{shutdown,boot}() with
> rproc_{stop,start}(), which skips destroy the virtio device at stop
> but re-initializes it again at start.
>
> Issue is that struct virtio_dev is not correctly reinitialized like done
> at initial allocation thanks to kzalloc() and kobject is considered as
> already initialized by kernel. That is due to the fact struct virtio_dev
> is allocated and released at vdev resource handling level managed and
> virtio device is registered and unregistered at rproc subdevices level.
>
> This patch initializes struct virtio_dev to 0 before using it and
> registering it.
>
> Fixes: 7e83cab824a8 ("remoteproc: Modify recovery path to use rproc_{start,stop}()")
>
> Reported-by: Xiang Xiao <xiaoxiang781216@gmail.com>
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 183fc42a510a..88eade99395c 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -332,6 +332,8 @@ int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
>         struct virtio_device *vdev = &rvdev->vdev;
>         int ret;
>
> +       /* Reset vdev struct as you don't know how it has been previously used */
> +       memset(vdev, 0, sizeof(struct virtio_device));
>         vdev->id.device = id,
>         vdev->config = &rproc_virtio_config_ops,
>         vdev->dev.parent = dev;
> --
> 2.7.4
>
