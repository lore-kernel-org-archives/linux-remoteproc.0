Return-Path: <s-anna@ti.com>
Subject: Re: [RFC LINUX PATCH 0/3] Allow remote to specify shared memory
References: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <df420852-6b5a-a2fc-4c4c-8556b9985e29@ti.com>
Date: Mon, 27 Mar 2017 10:54:44 -0500
MIME-Version: 1.0
In-Reply-To: <1490383336-23117-1-git-send-email-jliang@xilinx.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Wendy Liang <wendy.liang@xilinx.com>, bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Wendy,

On 03/24/2017 02:22 PM, Wendy Liang wrote:
> This patch enables the remoteproc to specify the shared memory.
> Remoteproc declared this memory as DMA memory.
> It can be used for virtio, or shared buffers.

You should be able to achieve this without any remoteproc core changes.
You can do this by defining a reserved-memory node in your DTS file (can
be a CMA pool or a DMA pool), assigning the node using memory-region in
your remoteproc DT node and using the function,
of_reserved_mem_device_init() in your remoteproc driver.

regards
Suman

> 
> Wendy Liang (3):
>   remoteproc: add rproc mem resource entry
>   remoteproc: add rproc_mem resource entry handler
>   remoteproc: Release DMA declare mem when cleanup rsc
> 
>  drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++++++++++++
>  include/linux/remoteproc.h           | 23 ++++++++++++++++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)
> 
