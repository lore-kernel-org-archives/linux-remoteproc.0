Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v4 1/5] rpmsg: virtio_rpmsg: set rpmsg_buf_size
 customizable
References: <1490701787-15205-1-git-send-email-loic.pallardy@st.com>
 <1490701787-15205-2-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <0cfbaa90-fc80-b475-848a-e490c547d4ae@ti.com>
Date: Fri, 26 May 2017 11:24:14 -0500
MIME-Version: 1.0
In-Reply-To: <1490701787-15205-2-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com, lee.jones@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On 03/28/2017 06:49 AM, Loic Pallardy wrote:
> Rpmsg buffer size is currently fixed to 512 bytes.
> This patch introduces a new capability in struct virtproc_info
> to tune shared buffer size between host and coprocessor
> according to the needs.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>

Acked-by: Suman Anna <s-anna@ti.com>

regards
Suman
