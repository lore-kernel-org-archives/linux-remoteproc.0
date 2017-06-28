Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 28 Jun 2017 12:24:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: rpmsg_core: fix null-ptr dereference for devices
 without ops
Message-ID: <20170628192422.GQ18666@tuxbook>
References: <1496403321-32234-1-git-send-email-henri.roosen@ginzinger.com>
 <20170625215148.GJ26155@builder>
 <75ec91fa-270b-862a-6e7e-15839dff3fc8@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75ec91fa-270b-862a-6e7e-15839dff3fc8@ginzinger.com>
To: Henri Roosen <henri.roosen@ginzinger.com>
Cc: linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 26 Jun 02:04 PDT 2017, Henri Roosen wrote:

> On 06/25/2017 11:51 PM, Bjorn Andersson wrote:
> > On Fri 02 Jun 04:35 PDT 2017, Henri Roosen wrote:
> > 
> > > A device might not have an ops structure registered. This
> > > patch fixes a null-prt dereference by checking ops before dereferencing
> > > it.
> > > 
> > 
> > In what scenario do you end up with a rpdev without ops defined?
> > 
> > You need at least create_ept defined in your ops to be able to do any
> > form of communication. So it would probably make more sense to add a
> > sanity check in rpmsg_register_device(), but perhaps I'm missing
> > something.
> 
> I was trying to add support for the generic rpmsg-char driver for
> virtio_rpmsg_bus.
> 
> The rpmsg-char driver gets registered using rpmsg_chrdev_register_device(),
> and IMHO this device should not have any
> .ops. The chrdev is not used for communication, only for creating devices.
> The devices which should have the .ops are the ones created using the
> rpmsg-char device.
> 

In order to create/open new channels from user space you need to call
rpmsg_create_ept() and this require a rpmsg_device context in order for
the communication to be associated with the appropriate link.

So we must set up the rpmsg_device context with the ops table including
create_ept() in order to maintain the reference back to the particular
virtio device (or SMD channel).


The main difference from previous implementations of this is that the
rpmsg_device does not have a primary endpoint. This removes the need for
the firmware to create a special channel to instantiate the user space
communication, but comes at the cost of the special spawning from the
individual backend drivers.

Regards,
Bjorn
