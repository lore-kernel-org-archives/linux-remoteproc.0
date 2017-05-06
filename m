Return-Path: <jassisinghbrar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170506011920.GH15143@minitux>
References: <20170504200539.27027-1-bjorn.andersson@linaro.org>
 <20170504200539.27027-3-bjorn.andersson@linaro.org> <CABb+yY2P=qPTYB6PDkjV82Qc67Xzer40BHRsOQP2m-gM3eK_UA@mail.gmail.com>
 <20170505183729.GG15143@minitux> <CABb+yY03imq8911rF9dHJjG_a_aosksA=tgk7Rog5AZSezHDyg@mail.gmail.com>
 <338c4262-cc6b-bed2-16fe-1767d1f0d5f6@codeaurora.org> <CABb+yY1K3Hyn7CzQCA6tHu-KrPigARc3cYgBdT8PNX7vjhPK0g@mail.gmail.com>
 <20170506011920.GH15143@minitux>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 6 May 2017 10:18:09 +0530
Message-ID: <CABb+yY1u9mspX1Zu0mg21JMYxpKxsXsvBa9LnF6VNr1_42UJUQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] soc: qcom: Introduce APCS IPC driver
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Sat, May 6, 2017 at 6:49 AM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Fri 05 May 13:22 PDT 2017, Jassi Brar wrote:

>> How is it supposed to work if a client queues more than one request?
>
> One such example is found in patch 5 in this series. There are two FIFOs
> in shared memory, one in each direction. Each fifo has a index-pair
> associated; a write-index is used by the writer to inform the reader
> where the valid data in the ring buffer ends and a read-index indicates
> to the writer how far behind the read is.
>
> The writer will just push data into the FIFO, each time firing off an
> APCS IPC interrupt and when the remote interrupt handler runs it will
> consume all the messages from the read-index to the write-index. All
> without the need for the reader to signal the writer that it has
> received the interrupts.
>
> In the event that the write-index catches up with the read-index a
> dedicated flag is set which will cause the reader to signal that the
> read-index is updated - allowing the writer to sleep waiting for room in
> the FIFO.
>
Interesting.Just for my enlightenment...

  Where does the writer sleep in the driver? I see it simply sets the
bit and leave.
Such a flag (or head and tail pointers matching) should be checked in
last_tx_done()

If you think RPM will _always_ be ready to accept new messages (though
we have seen that doesn't hold in some situations), then you don't
need last_tx_done. The client should call mbox_client_txdone() after
mbox_send_message().

thnx
