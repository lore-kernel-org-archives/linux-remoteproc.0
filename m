Return-Path: <mst@redhat.com>
Date: Fri, 20 Apr 2018 19:53:55 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: virtio remoteproc device
Message-ID: <20180420194321-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
To: linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, virtualization@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello!
I note the following in the serial console:

      if (is_rproc_serial(vdev)) {
                /*
                 * Allocate DMA memory from ancestor. When a virtio
                 * device is created by remoteproc, the DMA memory is
                 * associated with the grandparent device:
                 * vdev => rproc => platform-dev.
                 */
                if (!vdev->dev.parent || !vdev->dev.parent->parent)
                        goto free_buf;
                buf->dev = vdev->dev.parent->parent;

                /* Increase device refcnt to avoid freeing it */
                get_device(buf->dev);
                buf->buf = dma_alloc_coherent(buf->dev, buf_size, &buf->dma,
                                              GFP_KERNEL);
        }

Added here:
	commit 1b6370463e88b0c1c317de16d7b962acc1dab4f2
	Author: Sjur Br�ndeland <sjur.brandeland@stericsson.com>
	Date:   Fri Dec 14 14:40:51 2012 +1030

    virtio_console: Add support for remoteproc serial


I am not familiar with rproc so I have a question:
why is it required to use coherent memory here,
and why through a grandparent device?

Would it work to instead change vring_use_dma_api
to whitelist rproc (like we do for xen)?

I can sent a patch for your testing.
Thanks!

-- 
MST
