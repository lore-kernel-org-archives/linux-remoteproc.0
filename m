Return-Path: <peter.griffin@linaro.org>
Return-Path: <peter.griffin@linaro.org>
Date: Fri, 16 Dec 2016 10:39:16 +0000
From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [STLinux Kernel] [PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix
 channel creation
Message-ID: <20161216103916.GA13385@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481813396-1529-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On Thu, 15 Dec 2016, Loic Pallardy wrote:

> Since commit 4dffed5b3ac796b ("rpmsg: Name rpmsg devices based on
> channel id"), it is no more possible for a firmware to register twice
> a service (on different endpoints). rpmsg_register_device function
> is failing when calling device_add for the second time as second
> device has the same name as first one already register.
> It is because name is based only on service name and so is not more
> unique. Previously name was unique thanks to the use of rpmsg_dev_index.
> 
> This patch adds destination and source endpoint numbers device name to
> create an unique identifier.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> v2: Update commit header with commit ID generating regression
> Fix rpmsg_core instead of virtio_rpmsg

Acked-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter.
